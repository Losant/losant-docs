# MQTT Protocol

<a href="http://mqtt.org" target="_blank">MQTT</a> is a lightweight communication protocol targeted at embedded devices with limited connectivity. MQTT is the preferred communication mechanism between your gateways and the Structure platform. For most developers the Structure SDKs abstract the complexity of MQTT, but it's important to know what goes on under the hood.

The core concept of MQTT is publishing and subscribing to topics. Clients can publish any data they choose to any topics they choose. Other clients can then subscribe to those topics to receive that data.

What facilitates this communication is a central service called a message broker. All clients will open a connection to the message broker and the broker is responsible for properly routing messages to subscribers.

## The Structure Message Broker

In order to support existing MQTT implementations, Structure provides an MQTT message broker that can be used for any arbitrary topics and payloads. In order to make use of further Structure features like data collection, visualization, and workflows, Structure provides an opinionated MQTT implementation that must be followed.

The Structure Message Broker can be reached using several transports.

* TCP: `mqtt://broker.getstructure.io:1883`
* TLS: `mqtts://broker.getstructure.io:8883`
* WebSockets: `ws://broker.getstructure.io:80`
* Secure WebSockets: `wss://broker.getstructure.io:443`

### Authentication

Structure requires the client ID, username, and password fields be correctly set on all MQTT connect calls. `client id` must be set to a valid device ID that is already registered with the Structure platform. `username` must be set to a Structure access key. `password` must be set to a Structure access secret. Access keys can be obtained through your application settings.

For example, below is a connect call using the <a href="https://github.com/mqttjs/MQTT.js" target="_blank">Node.js MQTT client</a>

```javascript
var client = mqtt.connect('mqtts://broker.getstructure.io', {
  clientId: 'my-device-id',
  username: 'my-access-key',
  password: 'my-access-secret' });
```

### Structure MQTT Protocol
Once authenticated, the Structure message broker can be used for any MQTT communications as long as your custom topics don't overlap the Structure-specific topics. A Structure topic is anything that starts with `structure`.

Messages published to the Structure topics gain access to the full features of the Structure platform, including data collection, visualization, and workflows. In order for Structure to properly parse and understand these messages, a defined json-based payload format must be followed.

#### Publishing Device State

A [device state](/devices/state) is likely the most commonly published message. When thinking in terms of sensor data, the device state is typically the value of one or more sensors.

Topic: `structure/:deviceId/state`<br />
Payload:

```json
{
  "time" : { "$date" : "<ISO Date String>" },
  "data" : {
    "attribute-name" : "attribute-value",
    "attribute-name" : "attribute-value"
  }
}
```

The payload optionally includes the time, in <a href="https://docs.mongodb.org/manual/reference/mongodb-extended-json" target="_blank">EJSON</a> format, and any [device attributes](/devices/overview). If the time field is omitted, the broker will automatically set it to the current time. When thinking in terms of sensor data, it's very likely you'll have an attribute for each sensor attached to your device. For example, if your device has a temperature sensor, you may report state that has an attribute named "temperature".

```json
{
  "time" : { "$date" : "2015-11-04T19:42:06.710Z" },
  "data" : {
    "temperature" : 72
  }
}
```

When publishing data in this format, Structure will automatically store the data and make it available in our [visualization tools](/dashboards/overview) as well as exposing it through [workflows](workflows/overview). The attributes you send must first be configured on the device before Structure will accept the data.

#### Subscribing to Commands

[Commands](/devices/commands) instruct your device to perform a specific action. Commands are typically initiated using Structure workflows. Commands include a name and an optional payload. For example, if your device is a scrolling marquee, the command name might be "update text" and the payload would include the text to display.

Topic: `structure/:deviceId/command`<br />
Payload:

```json
{
  "name" : "command-name",
  "payload" : { }
}
```

The payload can be any arbitrary JSON object that provides necessary arguments to your command. Commands do not have to be pre-registered with Structure in order for them to be received. What commands your device supports is entirely up to your specific application and your device's firmware. Below is an example command that sets a thermostat to a specific temperature.

```json
{
  "name" : "set-temperature",
  "payload" : {
    "temperature" : 72
  }
}
```

## MQTT Version and Limitations

Structure supports MQTT version v3.1.1 with the following exceptions:

* QoS 1 and QoS 2 are not supported.
* Retained messages are not supported.
* CleanSession 0 is not supported.
