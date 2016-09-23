# Event Trigger

The event trigger will trigger a workflow whenever an event is created or changes state that matches the criteria defined in its configuration.

![Event Trigger](/images/workflows/triggers/event-trigger.png "Event Trigger")

## Configuration

There are three configurable criteria for matching events, the "level" of the event, the "subject" of the event, and the "state" of the event. Event subjects use case insensitive matching, with support for globing.

![Event Trigger Config](/images/workflows/triggers/event-trigger-config.png "Event Trigger Config")

In the above example, the workflow will be triggered whenever any event is created or placed in the "new" state that is of the "Error" level and has the subject "Abnormal Power Draw".

## Payload

The payload will include information about the event on the `data` field, as well as the standard workflow payload information.  In the general case, an event workflow payload will look like the following:

```json
{
  "time": <time of the event>,
  "data": {
    "id":           <event id>,
    "creationDate": <creation date of the event>
    "sourceType":   <"flow" or "user" or "device">,
    "sourceId":     <id of the source>,
    "level":        <event level - "critical" / "error" / "warning" / "info">,
    "state":        <current state of the event - "new" / "acknowledged" / "resolved">,
    "subject":      <subject of the event>,
    "message":      <detailed event message>,
    "data":         <structured data attached to the event>,
    "allUpdates":   <array of all updates to this event>,
    "latestUpdate": <most recent update to this event>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the workflow trigger>,
  "triggerType": "event",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "id":           "66c794a06895b00100cbe84c",
    "creationDate": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
    "sourceType":   "flow",
    "sourceId":     "56c794a06895b00100cbe84c",
    "level":        "error",
    "state"  :      "new",
    "subject":      "Abnormal Power Draw",
    "message":      "Draw on device FC12221TG112 has exceeded maximum threshold",
    "data":         null,
    "allUpdates":   [],
    "latestUpdate": null
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "error",
  "triggerType": "event",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Event Notification",
  "globals": {}
}
```
