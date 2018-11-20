flowclass: Application
description: Learn more about the Losant Meridian Trigger.

# Meridian Trigger

The Meridian Trigger will trigger a workflow whenever a zone or asset update is published that matches the location and/or map IDs defined in a [Meridian integration](/applications/integrations/#meridian).

![Meridian Trigger](/images/workflows/triggers/meridian-trigger.png "Meridian Trigger")

## Configuration

The trigger only takes one parameter: a Meridian integration that you previously [created](/applications/integrations/#meridian). Then, assuming the integration is connected, your workflow will trigger anytime a zone or asset update is received that matches the location and/or map IDs of the integration.

## Payload

```json
{
  "time": <time of the message>,
  "data": {
    "topic": "zone_update OR asset_update",
    "message": {
      ...
    }
  },
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

* **topic:** This will either be `zone_update` or `asset_update` depending on the type of Meridian message.
* **message:** An object containing the properties of the zone or asset update. The particular contents of this object vary depending on the update type and the definitions in Meridian.

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "topic": "zone_update",
    "message": {
      "zone_id": "51",
      "tag_id": "DD78ABA45293",
      "action": "exit",
      "timestamp": 1522115674753
    }
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
