flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant MQTT Trigger.

# MQTT Trigger

The MQTT Trigger will fire a workflow whenever a message is published to a topic of your choosing on the [Losant MQTT broker](/mqtt/overview/#the-losant-message-broker). If this is a [cloud](/workflows/cloud-workflows/) workflow, the node can also be configured to trigger whenever a message is published to one of your [MQTT broker integrations](/applications/integrations/#mqtt).

![MQTT Trigger](/images/workflows/triggers/mqtt-trigger.png "MQTT Trigger")

## Configuration

There are two properties that can be configured for the MQTT Trigger:

* <span class="flowclass-tag Cloud inline">Cloud Only</span> **Broker** is the MQTT broker that the workflow will trigger on. By default this is the [Losant broker](/mqtt/overview/#the-losant-message-broker), but you may also choose one of your [MQTT broker integrations](/applications/integrations/#mqtt). This option is only available if the workflow is a [cloud](/workflows/cloud-workflows/) workflow - if the workflow is an [edge](/workflows/edge-workflows/) workflow, the node will always trigger against the Losant MQTT broker.
* **MQTT Topic** When the trigger is configured to use the default Losant MQTT broker, you must also define a single topic on which the workflow should trigger when a message is published to that topic. This must be a [valid MQTT topic](http://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices), and furthermore, it cannot be a wildcard topic, an MQTT system topic, or a Losant-specific topic.

![MQTT Trigger Config](/images/workflows/triggers/mqtt-trigger-config.png "MQTT Trigger Config")

In the above example, the workflow will trigger whenever any message is published to the Losant broker on the MQTT topic "alerts/power".

## Payload

The payload will include the MQTT message on the `data` field, as well as the standard workflow payload information. The `triggerType` will be "mqttTopic" when using the Losant broker, and "integration" when using one of your integrations.

When triggering from the Losant broker, the value of `data` for the MQTT Trigger will be a string (unlike most other triggers, where the value of the `data` field is an object). In the general case, an MQTT workflow payload triggered by the Losant broker will look like the following:

```json
{
  "time": <time of the message>,
  "data": <the mqtt message payload as a string>,
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the mqtt trigger>,
  "triggerType": "mqttTopic",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

An MQTT workflow payload triggered by a [MQTT broker integration](/applications/integrations/#mqtt) will look like the following:

```json
{
  "time": <time of the message>,
  "data": {
    "message": <the mqtt message payload as a string>,
    "topic": <the topic the message was published on>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the mqtt integration>,
  "triggerType": "integration",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above (which is triggered from the Losant broker), a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": "machineOn",
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "alerts/power",
  "triggerType": "mqttTopic",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Usage Alert",
  "globals": {}
}
```
