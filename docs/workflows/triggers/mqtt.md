# MQTT Trigger

The MQTT trigger will trigger a workflow whenever a message is sent to one of your [MQTT broker integrations](/applications/integrations/#mqtt), or to a topic of your choosing on the [Losant MQTT broker](/mqtt/overview/#the-losant-message-broker).

![MQTT Trigger](/images/workflows/triggers/mqtt-trigger.png "MQTT Trigger")

## Configuration

When setting up the trigger, you must first choose an MQTT broker. If you select one of your [MQTT broker integrations](/applications/integrations/#mqtt), the workflow will trigger anytime a message is received on one of the integration's configured topics.

You may set up the trigger to work with the default Losant MQTT broker. When doing so, you must also define a single topic on which the workflow should trigger when a message is published to that topic. This must be a [valid MQTT topic](http://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices), and furthermore, it cannot be a wildcard topic, an MQTT system topic or a Losant-specific topic.

![MQTT Trigger Config](/images/workflows/triggers/mqtt-trigger-config.png "MQTT Trigger Config")

In the above example, the workflow will trigger whenever any message is published to the Losant broker on the MQTT topic "alerts/power".

## Payload

The payload will include the MQTT message on the `data` field, as well as the standard workflow payload information. The `triggerType` will be "mqttTopic" when using the Losant broker, and "integration" when using one of your integrations.

When triggering from the Losant broker, the value of `data` for the MQTT trigger will be a string (unlike most other triggers, where the value of the `data` field is an object). In the general case, an MQTT workflow payload triggered by the Losant broker will look like the following:

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
