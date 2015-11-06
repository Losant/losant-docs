# MQTT Overview

[MQTT](http://mqtt.org) is a lightweight communication protocol targeted at embedded devices with limited connectivity. MQTT is the preferred communication mechanism between your gateways and the Structure platform. For most developers the Structure SDKs abstract the complexity of MQTT, but it's important to know what goes on under the hood.

The core concept of MQTT is publishing and subscribing to topics. Clients can publish any data they choose to any topics they choose. Other clients can then subscribe to those topics to receive that data.

What facilitates this communication is a central service called a Message Broker. All clients will open a connection to the message broker and the broker is responsible for properly routing messages to subscribers.

TODO: picture. client -> broker -> client

## The Structure Message Broker

In order to support existing MQTT implementations, Structure provides an MQTT message broker that can be used for any arbitrary topics and payloads. In order to make use of further Structure features like data collection, visualization, and workflows, Structure provides an opinionated MQTT implementation that must be followed.

The Structure Message Broker can be reached using several transports.

TCP: `mqtt://broker.getstructure.io:1883` <br />
TLS: `mqtts://broker.getstructure.io:8883` <br />
WebSockets: `ws://broker.getstructure.io:80` <br />
Secure WebSockets: `wss://broker.getstructure.io:443`

### Authentication

Structure requires the client id, username, and password fields be correctly set on all MQTT connect calls. `client id` must be set to a valid gateway id that is already [registered](http://register-gateway) with the Structure platform. `username` must be set to a Structure project access key. `password` must be set to a Structure project access secret. These can be [created](http://create-project-key) through your project dashboard.

For example, below is a connect call using the [Node.js MQTT client](https://github.com/mqttjs/MQTT.js):

```javascript
var client = mqtt.connect('mqtt://broker.getstructure.io', {
  clientId: 'my-gateway-id',
  username: 'my-project-key',
  password: 'my-project-secret' });
```

### Structure MQTT Protocol
Once authenticated, the Structure message broker can be used for any MQTT communications as long as your custom topics don't overlap the Structure-specific topics. A Structure topic is anything that starts with `/structure`.

Messages published to the Structure topics gain access to the full features of the Structure platform, including data collection, visualization, and workflows. In order for Structure to properly parse and understand these messages, a defined json-based payload format must be followed.

#### Publishing Device State

A device state is likely the most commonly published message. When thinking in terms of sensor data, the device state is typically the value of the sensor.

Topic: `/structure/<deviceId>/state` <br />
Payload:

```json
{
  "time" : { "$date" : "<ISO Date String>" },
  "attributes" : {
    "attribute-name" : "attribute-value",
    "attribute-name" : "attribute-value",
    ...
  }
}
```

The payload includes the time, in [EJSON](https://docs.mongodb.org/manual/reference/mongodb-extended-json) format, and any device attributes. When thinking in terms of sensor data, it's very likely the device will only have a single attribute and you can name it anything you want. For example, you may name the attribute voltage if the sensor is recording an analog voltage input.

Example analog voltage payload:

```json
{
  "time" : { "$date" : "2015-11-04T19:42:06.710Z" },
  "attributes" : {
    "voltage" : 3.456
  }
}
```

When publishing data in this format, Structure will automatically store the data and make it available in our visualization tools as well as exposing it through workflows. The device id in the topic and attributes you send do not have to pre-registered with Structure in order to work. Structure will automatically add the device to your project and automatically collect and visualize any attributes sent. If the value of an attribute is a date, it's important to use the EJSON format so Structure can properly parse it, otherwise it will be interpreted as raw text data.
