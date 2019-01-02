---
flowclass:
  - Application
description: Learn more about the Losant Particle Trigger.
---

# Particle Trigger

The Particle Trigger will trigger a workflow whenever a event is published that matches one of the event names defined in the [Particle integration](/applications/integrations/#particle).

![Particle Trigger](/images/workflows/triggers/particle-trigger.png "Particle Trigger")

## Configuration

The trigger only takes one parameter: a Particle integration that you previously [created](/applications/integrations/#particle). Then, assuming the integration is connected, your workflow will trigger anytime an event is received that matches one of the integration's event names.

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

* **data:** The value of the published event
* **ttl:** The ttl of the published event
* **published_at:** The date/time when the event was published
* **coreid:** The ID of the Particle device that published the event
* **name:** The name of the event

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "data": "my_event_value",
    "ttl": 60,
    "published_at": "2017-02-19T17:25:55.409Z",
    "coreid": "particle_device_id",
    "name": "event_name"
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
