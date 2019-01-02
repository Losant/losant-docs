---
description: Learn about communicating with the Losant platform over MQTT.
---

# MQTT Protocol

<a href="http://mqtt.org" target="\_blank">MQTT</a> is a lightweight communication protocol targeted at embedded devices with limited connectivity. MQTT is the preferred communication mechanism between your devices and the Losant Platform. Currently, Losant has MQTT Clients
that easily wrap up the communication between Losant and a device for the following languages:

* Arduino with <a href="https://github.com/Losant/losant-mqtt-arduino" target="\_blank">losant-mqtt-arduino</a>  
  Available in Platform.io: `platformio lib install 277`  
  <br/>

* JavaScript with <a href="https://github.com/Losant/losant-mqtt-js" target="\_blank">losant-mqtt-js</a>  
  Available in Node Package Manager: `npm install losant-mqtt`  
  <br/>

* Python with <a href="https://github.com/Losant/losant-mqtt-python" target="\_blank">losant-mqtt-python</a>  
  Available in the Python Package Index: `pip install losant-mqtt`  
  <br/>

* Ruby with <a href="https://github.com/Losant/losant-mqtt-ruby" target="\_blank">losant-mqtt-ruby</a>  
  Available in RubyGems: `gem install losant_mqtt`  

For most developers the Losant MQTT Clients abstract the complexity of MQTT, but it
can also be important to know what goes on under the hood. If you are not working
in one of the languages above, the Losant MQTT broker is reasonably easy to use directly
with any MQTT client using the documentation below.

The core concept of MQTT is publishing and subscribing to topics. Clients can publish any data they choose to any topics they choose. Other clients can then subscribe to those topics to receive that data.

What facilitates this communication is a central service called a message broker. All clients will open a connection to the message broker and the broker is responsible for properly routing messages to subscribers.

## The Losant Message Broker

In order to support existing MQTT implementations, Losant provides an MQTT message broker that can be used for any arbitrary topics and payloads. In order to make use of further Losant features like data collection, visualization, and workflows, Losant provides an opinionated MQTT implementation that must be followed.

The Losant Message Broker can be reached using several transports.

* TCP: `mqtt://broker.losant.com:1883`
* TLS: `mqtts://broker.losant.com:8883`
* WebSockets: `ws://broker.losant.com:80`
* Secure WebSockets: `wss://broker.losant.com:443`

## Authentication

Losant requires the client ID, username, and password fields be correctly set on all MQTT connect calls. `client id` must be set to a valid device ID that is already registered with the Losant Platform. `username` must be set to a Losant access key. `password` must be set to a Losant access secret. Access keys can be obtained through your [application settings](/applications/access-keys/).

For example, below is a connect call using the <a href="https://github.com/mqttjs/MQTT.js" target="\_blank">Node.js MQTT client</a>

```javascript
var client = mqtt.connect('mqtts://broker.losant.com', {
  clientId: 'my-device-id',
  username: 'my-access-key',
  password: 'my-access-secret' });
```

## Losant MQTT Protocol

Once authenticated, the Losant message broker can be used for any MQTT communications as long as your custom topics don't overlap the Losant-specific topics. A Losant topic is anything that starts with `losant`.

Messages published to the Losant topics gain access to the full features of the Losant Platform, including data collection, visualization, and workflows. In order for Losant to properly parse and understand these messages, a defined JSON-based payload format must be followed.

### Publishing Device State

A [device state](/devices/state/) is likely the most commonly published message. When thinking in terms of sensor data, the device state is typically the value of one or more sensors. The most important, and only required, property of the device state payload is `data`, which is an object where the keys are device attribute names and the values are the values for those attributes. The `time` property is optional - when it is not included, Losant assumes that the reported state is for the current time. [Reporting a timestamp](/devices/state/#including-timestamps) can be beneficial, however, depending on your use case. The `flowVersion` property is also optional - when set, this property will control what version will be run of any workflows triggered by the payload. When not included, the `default` versions of any triggering workflows will be run. You can read more about workflow versions and the `flowVersion` property [here](/workflows/versioning/#triggering-specific-versions).

#### State Topic Form

<pre>losant/<span class="hljs-string"><b>DEVICE_ID</b></span>/state</pre>

#### State Payload Form

```json
{
  "data" : {
    "an_attribute_name": "an_attribute_value",
    "another_attribute_name": "another_attribute_value"
  },
  "time": <Optional Timestamp>,
  "flowVersion": <Optional Workflow Version Name>
}
```

When thinking in terms of sensor data, it's very likely you'll have an attribute for each sensor attached to your device. For example, if a device with ID `575ecf887ae143cd83dc4aa2` had a temperature sensor, you might report state that has an attribute named "temperature" by publishing to the topic below with the following payload:

#### Example State Topic

<pre>losant/575ecf887ae143cd83dc4aa2/state</pre>

#### Example State Payload

```json
{
  "data": {
    "temperature": 72
  },
  "time": { "$date": "2016-11-04T19:42:06.710Z" },
}
```

When a device publishes data in this format, Losant will automatically store the data and make it available in our [visualization tools](/dashboards/overview/) as well as exposing it through [workflows](/workflows/overview/). The attributes you send must first be configured on the device before Losant will accept the data.

### Subscribing to Commands

[Commands](/devices/commands/) instruct your device to perform a specific action. Commands are typically initiated using Losant workflows. Commands include a name and an optional payload. For example, if your device is a scrolling marquee, the command name might be "update text" and the payload would include the text to display.

#### Command Topic Form

<pre>losant/<span class="hljs-string"><b>DEVICE_ID</b></span>/command</pre>

#### Payload Topic Form

```json
{
  "name" : "command-name",
  "payload" : { }
}
```

The payload can be any arbitrary JSON value that provides necessary arguments to your command. Commands do not have to be pre-registered with Losant in order for them to be received. What commands your device supports is entirely up to your specific application and your device's firmware. Below is an example command that tells a thermostat associated with the device ID `575ecf887ae143cd83dc4aa2` to set itself to a specific temperature - the following payload is published on the topic below, and the device is listening on that topic for command messages:

#### Example Command Topic

<pre>losant/575ecf887ae143cd83dc4aa2/command</pre>

#### Example Command Payload

```json
{
  "name" : "set-temperature",
  "payload" : {
    "temperature" : 72
  }
}
```

## MQTT Version and Limitations

Losant supports MQTT version v3.1.1 with the following exceptions:

* QoS 2 is not supported for publishing or subscribing.
* Retained messages are not supported.
* CleanSession 0 is not supported.
* Maximum message payload size is 256KB.
