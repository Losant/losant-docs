# MQTT Trigger

The MQTT trigger will trigger a workflow whenever a message is sent to the configured topic on the Losant MQTT Broker.

![MQTT Trigger](/images/workflows/triggers/mqtt-trigger.png "MQTT Trigger")

## Configuration

The only configuration needed for this node is the topic name to trigger on. The node supports valid MQTT topic names. The topic is not allowed to be a wildcard topic, a MQTT system topic, or a Losant specific topic.

![MQTT Trigger Config](/images/workflows/triggers/mqtt-trigger-config.png "MQTT Trigger Config")

In the above example, the workflow will be triggered whenever any message is published on the MQTT topic "legacy/commands".

## Payload

The payload will include the payload of the MQTT message on the `data` field, as well as the standard workflow payload information. Unlike most other triggers, where the value of the `data` field is an object, the value of `data` for the MQTT trigger will be a string. In the general case, a MQTT workflow payload will look like the following:

```json
{
  "time": <time of the message>,
  "data": <the mqtt message payload, as a string>,
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the mqtt trigger>,
  "triggerType": "mqttTopic",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": "machineOn",
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "legacy/commands",
  "triggerType": "mqttTopic",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Command Translator",
  "globals": {}
}
```
