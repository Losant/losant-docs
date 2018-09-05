flowclass: Cloud
description: Learn more about the Losant Device: Connect Trigger.

# Device: Connect Trigger

The Device: Connect Trigger will fire a workflow whenever one or more devices connect to the Losant Platform, via the MQTT broker or the REST API.

![Device Connect Trigger](/images/workflows/triggers/on-connect-trigger.png "Device Connect Trigger")

## Configuration

The Device: Connect Trigger can be configured with one or more specific devices, or a selection of tags (or both). When a device that matches anything in the selection connects to Losant, the workflow will trigger. See the [device query](/devices/device-queries/) documentation for more info about how ID and tag matching works.

![Device Connect Trigger Config](/images/workflows/triggers/on-connect-trigger-config.png "Device Connect Trigger Config")

In the above example, the workflow will be triggered whenever any device that has a `location` tag connects to Losant.

## Payload

The payload will have an empty object on the standard data field, since there is no useful data to report other than the fact the device connected. In the general case, a device connect workflow payload will look like the following:

```json
{
  "time": <time of the connection>,
  "data": { },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceIdConnect",
  "deviceTags": {<any tags for the device>},
  "deviceName": <the device name>,
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": { },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceIdConnect",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "deviceName": "My Factory Device",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Connection Info",
  "globals": {}
}
```
