# On Disconnect Trigger

The on disconnect trigger will trigger a workflow whenever one or more devices disconnect from the Losant Platform.

![On Disconnect Trigger](/images/workflows/triggers/on-disconnect-trigger.png "On Disconnect Trigger")

## Configuration

The on disconnect trigger can be configured with one or more specific devices, or a selection of tags (or both). When a device that matches anything in the selection disconnects from Losant, the workflow will trigger. See the [device query](/devices/device-queries/) documentation for more info about how ID and tag matching works.

![On Disconnect Trigger Config](/images/workflows/triggers/on-disconnect-trigger-config.png "On Disconnect Trigger Config")

In the above example, the workflow will be triggered whenever any device that has a `location` tag disconnects from Losant.

## Payload

The payload will have various information on the data field about the connection that was terminated. In the general case, an on disconnect workflow payload will look like the following:

```json
{
  "time": <time of disconnect>,
  "data": {
    "disconnectReason": <a reason for the disconnection>,
    "messagesFromDevice": <count of messages sent from device while connected>,
    "messagesToDevice": <count of messages sent to device while connected>,
    "connectedAt": <time when connection was originally established>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceIdDisconnect",
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
    "disconnectReason": "Connection Lost",
    "messagesFromDevice": 1385,
    "messagesToDevice": 0,
    "connectedAt": Fri Feb 19 2016 16:25:00 GMT-0500 (EST)
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceIdDisconnect",
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
