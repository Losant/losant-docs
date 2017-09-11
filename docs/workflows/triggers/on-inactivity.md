# Device: Inactive Trigger

The device inactive trigger will trigger a workflow whenever one or more devices do not report state for the configured period of time.

![Device Inactive Trigger](/images/workflows/triggers/device-inactive-trigger.png "Device Inactive Trigger")

## Configuration

There are two parts to configuring a device inactive trigger - the devices to trigger on, and the amount of time a device should be inactive before triggering. The trigger can be configured with one or more specific devices, or a selection of tags (or both). See the [device query](/devices/device-queries/) documentation for more info about how ID and tag matching works. The inactivity time can be configured as seconds, minutes, hours, or days, and can be any duration between 1 second and 1 year. When a device that matches anything in the selection does not report [state](devices/state/) for the configured period of time, the workflow will trigger.

![Device Inactive Trigger Config](/images/workflows/triggers/device-inactive-trigger-config.png "Device Inactive Trigger Config")

In the above example, the workflow will be triggered whenever any device with the `floor` tag set to `2` or the specific devices `FM00000001A` or `FM00000002A` do not report state for 2 hours.

## Payload

The payload will include the date of the last state report in the data field, as well as the duration of inactivity. In the general case, a device inactive workflow payload will look like the following:

```json
{
  "time": <time of the event>,
  "data": {
    "lastActivity": <time of last state report>,
    "inactivitySeconds": <duration of inactivity>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceIdInactivity",
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
    "lastActivity":  Fri Feb 19 2016 16:26:00 GMT-0500 (EST),
    "inactivitySeconds": 7200
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
  "flowName": "Report Failure Warning",
  "globals": {}
}
```

## Notes

The device inactive trigger starts monitoring from scratch when added or changed. This means that for the inactive trigger to fire, one state message must arrive from the device **after** the inactive trigger is configured, and then inactivity starts counting from that message (or subsequent messages) onward. If a device never reports state after the trigger is configured, the trigger will never fire for that device.

In addition, the timestamp of state payload **arrival** at Losant is used for calculating inactivity. This means that a device that sends a state payload now whose data is for 1 day ago will be counted as active *now*, not retroactively active 1 day ago.
