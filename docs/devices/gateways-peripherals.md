# Gateways and Peripherals

Some types of devices, like Bluetooth sensors, cannot connect directly to Losant. They require some form of middle man in order to communicate externally. In order to facilitate this, Losant has the concept of Gateway and Peripheral devices. Gateway devices are permitted to report state and receive commands on behalf of Peripheral devices.

## Gateways

Gateways are very similar to regular devices. They connect directly to Losant and can report their own state and receive commands. The only difference is that gateways are allowed to report state for other peripheral devices.

A gateway device is created by choosing the `Gateway` device type when adding a new device.

![Add Gateway](/images/devices/gateways-peripherals/create-gateway.png "Add Gateway")

## Peripherals

Unlike regular devices, peripherals do not connect directly to Losant. They are typically connected to a Gateway using something like Bluetooth. How a peripheral is actually connected to a gateway is entirely up to your specific environment.

Peripherals are created by choosing the `Peripheral` device type when adding new devices. You must also then choose the Gateway device that is permitted to report on behalf of this peripheral.

![Add Peripheral](/images/devices/gateways-peripherals/create-peripheral.png "Add Peripheral")

## Reporting State for Peripheral

Once a gateway and one or more peripherals are created, it's now up to the gateway to report state on behalf of the peripheral whenever required. In order to accomplish this, gateways are simply permitted to publish and subscribe to a peripheral's MQTT topics and POST to a peripheral's REST endpoints. These requests can be done over the gateway's connection and using the gateway's authentication tokens. Below are a few examples.

A gateway can publish state for itself by publishing to its own MQTT state topic:

```text
losant/my-gateway-id/state
```

A gateway can also publish to a peripheral's MQTT state topic:

```text
losant/my-peripheral-id/state
```

A gateway can subscribe to its own MQTT command topic:

```text
losant/my-gateway-id/command
```

A gateway can also subscribe to any peripheral's MQTT command topic:

```text
losant/my-peripheral-id/command
```

A gateway can POST its own state using REST to the following endpoint:

```text
/applications/my-application-id/devices/my-gateway-id/state
```

A gateway can also post to a peripheral's REST state endpoint:

```text
/applications/my-application-id/devices/my-peripheral-id/state
```

Please refer to the [MQTT](/mqtt/overview/) and [REST](/rest-api/overview/) documentation for further details on the format of these requests.

Below is an example of how to use the [Node.js MQTT module](https://github.com/mqttjs/MQTT.js) to connect as a gateway and publish state for a peripheral.

```javascript
var mqtt = require('mqtt');

// Connect to Losant as the Gateway.
var client = mqtt.connect('mqtts://broker.losant.com', {
  clientId: 'my-gateway-id',
  username: 'my-access-key',
  password: 'my-access-secret'
});

client.on('connect', function() {

  // Example peripheral state. Typically this would come over some
  // remote connection, like Bluetooth.
  var peripheralState = { data: { temperature: 72 }};

  // Publish state for the peripheral.
  client.publish('losant/my-peripheral-id', JSON.stringify(peripheralState));  
});
```

When and how a gateway publishes these message is entirely up to your environment. For example, if the peripheral is a [LightBlueBean](https://punchthrough.com/bean) connected over Bluetooth to a Raspberry Pi gateway, the Pi may report the peripheral's state every few seconds by first requesting the temperature over the Bluetooth connection.

Gateways and also be used to configure MQTT bridges. Please read our tutorial on [setting up a Mosquitto MQTT bridge](https://www.losant.com/blog/how-to-configure-mosquitto-bridge-to-losant) for more details.

To the rest of the system, there's no difference between a gateway reporting state on behalf of a peripheral versus a device reporting state directly. You can now visualize the data, trigger workflows, etc.
