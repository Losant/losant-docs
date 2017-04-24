# Google Pub/Sub Trigger

The Google Pub/Sub trigger will trigger a workflow whenever a message is sent to one of the topics defined a given [Google Pub/Sub integration](/applications/integrations/#google-pubsub).

![Google Pub/Sub Trigger](/images/workflows/triggers/google-pub-sub-trigger.png "Google Pub/Sub Trigger")

## Configuration

The trigger only takes one parameter: a Google Pub/Sub integration that you previously [created](/applications/integrations/#google-pubsub). Then, assuming the integration is connected, your workflow will trigger anytime a message is received on one of the integration's topics.

## Payload

```json
{
  "time": <time of the message>,
  "data": <message properties>,
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the integration>,
  "triggerType": "integration",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

In addition to the standard workflow payload information, the payload will include an object in the `data` field, which will include the following properties:

* **attributes:** A key/value map of attributes passed with the message
* **data:** The message that was published on the topic
* **id:** The Google Cloud Pub/Sub message ID
* **timestamp:** Google Cloud Pub/Sub message timestamp
* **topic:** The topic on which the message was received

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "attributes": {
      "myAttribute": "myValue"
    },
    "data": "Hello world!",
    "id": "19916711285",
    "timestamp": 1492710130123,
    "topic": "myGoogleTopic"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c74add0d3d350100043380",
  "triggerType": "integration",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Usage Alert",
  "globals": {}
}
```
