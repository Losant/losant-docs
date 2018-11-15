# Part 3 - Device Registration

In [Part 1](/experiences/walkthrough/part1/) and [Part 2](/experiences/walkthrough/part2/) of this walkthrough, we successfully built a custom API for our lōm mobile application that allows users to register and then log in. In this part, we'll create a new API endpoint that allows devices to perform on-demand registration.

<img style="width: 225px; margin: 0 auto; display: block;" src="/images/experiences/walkthrough/part-3/add-pot.jpg" alt="Add Smart Pot" />

Pairing a device to the user's account is still one of the most complicated steps when initially setting up a consumer product. There are many different ways to accomplish this. The lōm product uses an access point mechanism where the user's mobile phone is connected to an access point on the physical device itself. The registration flow is described below.

1. The lōm device exposes an access point.
1. The lōm mobile app connects the user's phone to the access point.
1. The lōm mobile app connects the device to the user's Wi-Fi.
1. The lōm mobile app sends the user's token to the device.
1. The device requests a registration endpoint using the user's token.
1. The registration endpoint creates the device and access key pair.
1. The device connects directly to Losant's MQTT broker.
1. The lōm mobile app connects the user's mobile device back to their Wi-Fi.

As you can see there are a lot of steps involved in pairing a device. This guide will cover details for steps 5 and 6, which involve creating an Experience Endpoint for registration. The other steps are very specific to the actual hardware used and are outside the scope of this guide.

The first thing we need to do is create the `POST /devices` endpoint that our device can use to register itself.

![Register Endpoint](/images/experiences/walkthrough/part-3/register-endpoint.png "Register Endpoint")

1. Set the `Method` to `POST`.
1. Set the `Route` to `/devices`.
1. Set the `Description` to anything you want.
1. Set the `Access Control` to `Any authenticated user`.

Unlike the `/users` and `/auth` endpoints, this endpoint requires a valid user token. The lōm app does not require the use of user groups, so any authenticated user is allowed to request this endpoint. User groups allow you to more granularly define access to specific endpoints for subsets of your Experience Users.

The next thing we need to do is create a workflow that is triggered by this endpoint. This workflow will do several things:

1. Validate that the manufacturer ID sent by the device is valid.
1. Create a new device within Losant.
1. Link the device to the user using [device tags](/devices/overview/#device-tags).
1. Create an access key pair for the newly created device.

This endpoint will require two fields in its body. One is a custom name provided by the user and the second is a manufacturer ID. This ID can be anything as long as it's unique for each device. A MAC address or a Bluetooth ID work well, but it can be any identifier that works for your company. The endpoint will then reply with the new device ID, an access key, and an access secret.

```text
POST /devices
```

Body:

```json
{
  "deviceName": "custom-device-name",
  "manufacturerId": "000000"
}
```

Response:

```json
{
  "deviceId": "new-device-id",
  "accessKey": "device-access-key",
  "accessSecret": "device-access-secret"
}
```

Like all endpoint workflows, start by adding an [Endpoint trigger](/workflows/triggers/endpoint/) to the canvas.

![Endpoint Trigger](/images/experiences/walkthrough/part-3/endpoint-trigger.png "Endpoint Trigger")

The only required configuration option is to set the `Endpoint Method / Route` to `POST /devices`. This workflow will now trigger whenever the `POST /devices` endpoint is requested.

The next step is to add some basic validation to ensure the client provided the manufacturer ID and the custom device name. Add a [Conditional node](/workflows/logic/conditional/) and an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) to the canvas.

![Validate Input](/images/experiences/walkthrough/part-3/validate-input.png "Validate Input")

1. Set the `Expression` on the Conditional node to `{{ data.body.manufacturerId }} && {{ data.body.deviceName }}`. This will verify that both "manufacturerId" and "deviceName" are present on the POST body.
1. Set the `Response Code Template` to `400` on the Endpoint Reply node. 400 is the HTTP status code for `Bad Request`.
1. Set the `Response Body Template` on the endpoint reply node to `{ "error": "manufacturerId and deviceName are required." }`.

Now if a client makes a request against the lōm API to register a device and does not provide all required fields, the API will respond with a 400 (Bad Request).

The next step is to check that the manufacturer ID that was supplied is valid.

![Validate ID](/images/experiences/walkthrough/part-3/valid-id.png "Validate ID")

Since this check is so specific to each use-case, this workflow simply adds a representative conditional node that will always return true. In practice, this is the place you'd query some collection of valid IDs. What represents a valid ID is entirely up to you. If the ID is invalid, the API simply returns a 400 (Bad Request) back to the user.

Now we're to the meat of this workflow. The next step is to use the [Losant API node](/workflows/data/losant-api/) to create a new device.

![Create Device](/images/experiences/walkthrough/part-3/new-device.png "Create Device")

The Losant API node allows you to manage all resources within your Losant application. In this case, we're using it to create a new Losant device.

Set the `Resource and Action` to `Devices: POST`. It's important to note that this `Devices: POST` is not your devices endpoint. This is calling the devices endpoint for [Losant's API](/rest-api/overview/).

Set the `device` to the following:

```json
{
  "name": "{{ data.body.deviceName }}",
  "tags": [ {
    "key": "owner",
    "value": "{{ experience.user.id }}"
  },
  {
    "key": "manufacturerId",
    "value": "{{ data.body.manufacturerId }}"
  } ],
  "attributes": [ {
    "name": "moisture",
    "dataType": "number"
  } ]
}
```

This object is what Losant expects when creating a new [Device](/devices/overview/). The `name` field is set to `{{ data.body.deviceName }}`, which is what was passed into this endpoint as part of the POST body.

[Device tags](/devices/overview/#device-tags) are used to organize devices and provide a way to easily query them from the Losant API. In this example, we're setting two tags: "owner" and "manufacturerId". By setting the owner tag, we can easily query the Losant API for all devices owned by this user, which we'll see in part 4 of this walkthrough. Losant automatically adds the Experience User to the payload on every authenticated request, which is why the current user ID can be obtained at `experience.user.id`.

The manufacturerId tag is not used in this guide, but it's handy to keep around in case you need to map the device back to the underlying ID at a later time.

[Attributes](/devices/state/) describe what kind of data this device will be reporting. For lōm, each device simply reports its moisture as a number.

Set the `Payload Path to Store Response` to `data.newDevice`. This will put the result of this Losant API request back onto the payload at this location. The result will be the newly created device object.

Now that we have a device, we can use another Losant API node to create an access key for it.

![Access Key](/images/experiences/walkthrough/part-3/access-key.png "Access Key")

[Access Keys](/applications/access-keys/) allow devices to authenticate against the Losant MQTT broker or REST interface to report state or receive commands.

Set the `Resource and Action` to `Application Keys: POST`, which will create a new access key within your Losant application.

Set the `applicationKey` to the following:

```json
{
  "description": "Access key for {{ data.newDevice.result.id }}",
  "deviceIds": [ "{{ data.newDevice.result.id }}" ]
}
```

This will create an access key that's only valid for the device we just created in the previous node.

Set the `Payload Path to Store Response` to `data.accessKey`, which will put the result of this Losant API request back onto the payload. This will include the access key and secret that we need to send back in the endpoint reply.

The last thing we need to do is reply to the request with the newly created device ID, the access key, and the access secret.

![Endpoint Reply](/images/experiences/walkthrough/part-3/endpoint-reply.png "Endpoint Reply")

Set the `Response Code Template` to `201`, which is the HTTP status code for `Created`.

Set the `Response Body Template` to the following:

```json
{
  "deviceId": "{{ data.newDevice.result.id }}",
  "accessKey": "{{ data.accessKey.result.key }}",
  "accessSecret": "{{ data.accessKey.result.secret }}"
}
```

Add a `Content-Type` header and set the value to `application/json`.

We can now test this endpoint and see that it does successfully create a device and access key.

```text
curl -H "Content-Type: application/json" \
  -H "Authorization: Bearer USER_TOKEN" \
  -X POST \
  -d '{"deviceName":"My Awesome Plant","manufacturerId":"000000"}' \
  https://example.onlosant.com/devices
```

```json
{
  "deviceId": "new-device-id",
  "accessKey": "new-access-key",
  "accessSecret": "new-access-secret"
}
```

With this information, the lōm device can now form a secure connection to the [Losant MQTT broker](/mqtt/overview/) and begin publishing its sensor data.

If you navigate to your Losant application's device list, you'll also see the new device with the attributes and tags properly configured.

![Device Page](/images/experiences/walkthrough/part-3/device-page.png "Device Page")

This concludes part 3 of the experiences walkthrough. At this point the lōm app now has all of the API endpoints required to sign up users, log in, and register new devices. In the next part of this guide, we'll cover how to access device data in order to display it back to the user.

**[Continue to Part 4](/experiences/walkthrough/part4/)**: Viewing Device Data
