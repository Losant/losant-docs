flowclass: Application
description: Learn more about the Losant Device: State Trigger.

# Device: State Trigger

The Device: State Trigger will trigger a workflow whenever one or more devices report state.

![Device State Trigger](/images/workflows/triggers/device-trigger.png "Device State Trigger")

## Configuration

The Device: State Trigger can be configured with one or more specific devices, or a selection of tags (or both). When a device that matches anything in the selection reports [state](devices/state/), the workflow will trigger. See the [device query](/devices/device-queries/) documentation for more info about how ID and tag matching works.

![Device State Trigger Config](/images/workflows/triggers/device-trigger-config.png "Device State Trigger Config")

In the above example, the workflow will be triggered whenever any device with the `floor` tag set to `2` reports state, as well as whenever devices `FM00000001A` or `FM00000002A` report.

## Payload

The payload will include the triggering device's state on the `data` field. The payload will only include the attributes currently reported by the device. So for example, if the device has four attributes configured, but only reports state containing one, this payload will only include the one attribute. In the general case, a device state workflow payload will look like the following:

```json
{
  "time": <time of the event>,
  "data": {
    "attribute-name": value,
    "attribute-name": value,
    ...
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceId",
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
  "data": {
    "current": 10,
    "on": true
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "deviceName": "My Factory Device",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Consumption Warning",
  "globals": {}
}
```
