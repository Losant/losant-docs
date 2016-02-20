# Event Trigger

The event trigger will trigger a workflow whenever an event matches the criteria defined in its configuration.

![Event Trigger](/images/workflows/triggers/event-trigger.png "Event Trigger")

## Configuration

There are two configurable criteria for matching events, the "level" of the event, and the "subject" of the event.  At least one of the criteria must be specified, so, for example, if "Any Level" is selected for matching the event level, then an event subject must be specified to match against.  Event subjects are matched using exact string matching, so be sure to match capitalization.

![Event Trigger Config](/images/workflows/triggers/event-trigger-config.png "Event Trigger Config")

In the above example, the workflow will be triggered whenever any event is created that is of the "Error" level and has the subject "Abnormal Power Draw".

## Payload

The payload will include information about the event on the `data` field, as well as the standard workflow payload information.  In the general case, an event workflow payload will look like the following:

```json
{
  "time": <time of the event>
  "data": {
    "sourceType": <"flow" or "user" or "device">,
    "sourceId":   <id of the source>,
    "level":      <level of the event - "error" or "warning" or "info">,
    "subject":    <subject of the event>,
    "message":    <detailed event message>
  },
  "applicationId": <id of the current application>,
  "triggerId": <id of the workflow trigger>,
  "triggerType": "event",
  "flowId": <id of the current workflow>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "sourceType": "flow",
    "sourceId":   "56c794a06895b00100cbe84c",
    "level":      "error",
    "subject":    "Abnormal Power Draw",
    "message":    "Draw on device FC12221TG112 has exceeded maximum threshold"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "error/Abnormal Power Draw",
  "triggerType": "event",
  "flowId": "56c74add04d0b50100043381"
}
```
