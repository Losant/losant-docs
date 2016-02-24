# Device Trigger

The device trigger will trigger a workflow whenever one or more devices report state.

![Device Trigger](/images/workflows/triggers/device-trigger.png "Device Trigger")

## Configuration

The device tag trigger can be configured with one or more specific devices, or a selection of tags (or both).  When a device that matches anything in the selection reports state, the workflow will trigger.  See the [device query](/devices/device-queries/) documentation for more info about how id and tag matching works.

![Device Trigger Config](/images/workflows/triggers/device-trigger-config.png "Device Trigger Config")

In the above example, the workflow will be triggered whenever any device with the `floor` tag set to `2` reports state, as well as whenever devices `FM00000001A` or `FM00000002A` report.

## Payload

The payload will include the triggering device's state on the `data` field. The payload will only include the attributes currently reported by the device. So for example, if the device has four attributes configured, but only reports state containing one, this payload will only include the one attribute.  In the general case, a device workflow payload will look like the following:

```json
{
  "time": <time of the event>,
  "data": {
    "attribute-name" : value,
    "attribute-name" : value,
    ...
  },
  "applicationId": <id of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceId",
  "flowId": <id of the current workflow>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "current" : 10,
    "on" : true
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "flowId": "56c74add04d0b50100043381"
}
```
