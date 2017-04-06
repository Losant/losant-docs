# Part 4 - Viewing Device Data

In [Part 1](/experiences/walkthrough/part1/), [Part 2](/experiences/walkthrough/part2/), and [Part 3](/experiences/walkthrough/part3/) of this walkthrough we've created an API for our lōm smart plant mobile app that allows users to sign up, log in, and register devices. In this part we're going to add the ability to view a list of devices owned by the current user and cover how to request historical device data.

<img style="width: 450px; margin: 0 auto; display: block;" src="/images/experiences/walkthrough/part-4/device-data.png" alt="Device Data" />

The first endpoint we'll create is `GET /devices`, which will return a list of all devices owned by the currently authenticated user.

![Devices Endpoint](/images/experiences/walkthrough/part-4/devices-endpoint.png "Devices Endpoint")

1. Set the `Method` to `GET`.
1. Set the `Route` to `/devices`.
1. Set the `Description` to anything you want.
1. Set the `Access Control` to `Any authenticated user`.

Like all endpoints we've created, this one will also need a workflow with a matching endpoint trigger. Next, add a [Get Device node](/workflows/data/get-device/) that we'll use to look up the user's devices.

![Get Devices](/images/experiences/walkthrough/part-4/get-devices.png "Get Devices")

1. Set the `Find by...` to `Tag Query`. This allows us to query devices by their tags.
1. Check the `Return multiple devices?` checkbox.
1. Add a tag query and set the `Key Template` to "owner" and set the value template to `{{ experience.user.id }}`.
1. Check the `Return tags as an object map instead of an array` checkbox. This changes how tags are returned. It makes them an object map, which is easier to work with in most cases.
1. Set the `Result Path` to `data.devices`.

In Part 3 of this walkthrough, we showed how devices were tagged with the owner when they were created. We can now use this tag to find all devices owned by the user that requested this endpoint. Losant automatically adds the Experience User to the payload whenever an authenticated route is requested, so we can get the user ID at `experience.user.id`.

![Experience User](/images/experiences/walkthrough/part-4/experience-user.png "Experience User")

All that's left to do for this endpoint is to reply with the devices we just looked up.

![Devices Reply](/images/experiences/walkthrough/part-4/devices-reply.png "Devices Reply")

1. Set the `Response Code Template` to `200`, which is the HTTP status code for OK.
1. Change the `Reply Body` radio to `Payload Path`.
1. Change the `Reply Body` to `data.devices`. This is the location on the payload where the Get Device node put its result. We're going to simply reply with the same value.
1. Add a `Content-Type` header with the value `application/json`.

At this point, the lōm mobile app can now request all of the devices owned by the currently logged-in user. You can test this route by requesting the devices created in Part 3 of this walkthrough.

```text
curl -H "Authorization: Bearer USER_TOKEN" \
  https://example.onlosant.com/devices
```

```json
[
  {
    "name": "My Awesome Plant",
    "tags": {
      "owner": [
        "58e016591c3ce300017cc5d4"
      ],
      "manufacturerId": [
        "000000"
      ]
    },
    "attributes": [
      {
        "name": "moisture",
        "dataType": "number"
      }
    ],
    "id": "58e4605f29eeec0001d383df"
    ...
  }
]
```

The lōm mobile app now allows the user to select a device from the list to show historical moisture data collected by that device. In order to support this, we need to create a new endpoint to get this data. We'll call it `GET /devices/{id}/data`. The device ID for each device is available on the result of the `GET /devices` endpoint above.

![Device Data Endpoint](/images/experiences/walkthrough/part-4/device-data-endpoint.png "Device Data Endpoint")

1. Set the `Method` to `GET`.
1. Set the `Route` to `/devices/{id}/data`. This route makes use of route parameters, which provide a way to pass variables to the endpoint. In this case, we'll be passing the Losant device ID.
1. Set the `Access Control` to `Any authenticated user`.

Next, create a workflow for this endpoint with a matching endpoint trigger. The first thing this workflow needs to do once it's triggered is to determine whether or not the current user has access to the device ID that was passed in. We can do this by getting the device that matches the route parameter and then checking that its owner tag matches the ID of the current user.

First, add a get device node to the canvas.

![Get Device](/images/experiences/walkthrough/part-4/get-device.png "Get Device")

1. Set the `ID Template` to `{{ data.params.id }}`.
1. Check the `Return tags as an object map instead of an array` checkbox.
1. Set the `Result Path` to `data.device`.

Losant automatically parses the route parameters and put them on the payload. In this case, our device ID parameter `id` can be found at `data.params.id`.

![Params Payload](/images/experiences/walkthrough/part-4/params-payload.png "Params Payload")

The next step is to add a [Conditional node](/workflows/logic/conditional/) to check that this device has an owner tag that matches the current user.

![Conditional](/images/experiences/walkthrough/part-4/conditional.png "Conditional")

Set the `Expression` to the following:

```text
{{ data.device }} && {{ data.device.tags.owner.[0] }} === {{ experience.user.id }}
```

This expression first checks to see if any device was returned at all. Since this route could be requested with any value as the ID, for example `/devices/not-a-real-value/data`, the result of the Get Device node could be `null`. It then checks that the value of the owner tag matches the current Experience User. Since Losant devices can have duplicate values for the same tag, the values are always returned as an array, which is why the syntax is `data.device.tags.owner.[0]`.

If the device can't be found, or the owner tag doesn't match, simply use an [Endpoint Reply node](/workflows/outputs/endpoint-reply/) to respond with a 403 (Forbidden).

If we did get a valid device ID, we can now use the [Time Series node](/workflows/data/time-series/) to request historical data for the device.

![Time Series](/images/experiences/walkthrough/part-4/time-series.png "Time Series")

1. Select the `Use Device ID(s) specified on the current payload` radio.
1. Set the `Device ID(s) JSON Path` to `data.params.id`. This will perform a time series query against the device that was passed in through the route parameters.
1. Set the `Time Range` to whatever range makes sense for the application. In this example, it's showing the last 24 hours of data.
1. Set the `Resolution` to whatever makes sense for the application. In this example, it will return 24 hours of data with a data point for each 5 minute interval.
1. Set the `Payload Path for Value` to `data.resultData`.

The Time Series node provides powerful aggregation support for data that has been reported by your devices. The duration, resolution, and aggregation can all be changed to match your desired result. The last step is to reply with this data using an Endpoint Reply node.

![Data Reply](/images/experiences/walkthrough/part-4/data-reply.png "Data Reply")

1. Set the `Response Code Template` to `200`, which is the HTTP status code for `OK`.
1. Change the `Reply Body` radio to `Payload Path`.
1. Set the `Reply Body` to `data.resultData`. This where the Time Series node put its result, so this reply is simply sending the result back to the client.
1. Add a `Content-Type` header with the value `application/json`.

You can now test this endpoint to see data that has been reported by your application's devices.

```text
curl -H "Authorization: Bearer USER_TOKEN" \
  https://example.onlosant.com/devices/my-device-id/data
```

```json
[
  {
    "time": "2017-04-05T05:05:00.000Z",
    "sum": 235,
    "count": 5,
    "value": 47
  },
  {
    "time": "2017-04-05T05:00:00.000Z",
    "sum": 235,
    "count": 5,
    "value": 47
  }
  ...
]
```

The result of this API request will be a data point for each five-minute interval over the last 24 hours. Since the aggregation in the Time Series node was set to `MEAN`, the `value` above will be the average. The `count` is the number of data points collected in that five-minute interval. The `sum` is the value of every point collected in the five-minute interval added together.

The lōm mobile app now has an API that supports all required features. Users can sign up, they can log in, they can register devices, they can see a list of their devices, and they can view historical data for each device. This concludes the Losant Application Experience walkthrough. If you have additional questions about experiences, please visit our [forums](https://forums.losant.com).

![lom banner](/images/experiences/walkthrough/lom-banner.jpg "lom banner")
