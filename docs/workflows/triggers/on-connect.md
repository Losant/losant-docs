# On Connect Trigger

The on connect trigger will trigger a workflow whenever one or more devices connect to the Structure platform.

![On Connect Trigger](/images/workflows/triggers/on-connect-trigger.png "On Connect Trigger")

## Configuration

The on connect trigger can be configured with one or more specific devices, or a selection of tags (or both).  When a device that matches anything in the selection connects to Structure, the workflow will trigger.  See the [device query](/devices/device-queries/) documentation for more info about how id and tag matching works.

![On Connect Trigger Config](/images/workflows/triggers/on-connect-trigger-config.png "On Connect Trigger Config")

In the above example, the workflow will be triggered whenever any device that has a `location` tag connects to Structure.

## Payload

The payload will have an empty object on the standard data field, since there is no useful data to report other than the fact the device connected.  In the general case, an on connect workflow payload will look like the following:

```json
{
  "time": <time of the connection>,
  "data": { },
  "applicationId": <id of the current application>,
  "triggerId": <id of the triggering device>,
  "triggerType": "deviceIdConnect",
  "deviceTags": [<any tags for the device>],
  "flowId": <id of the current workflow>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": { },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceIdConnect",
  "deviceTags": [
    { "key": "floor", "value": "2" },
    { "key": "location", "value": "warehouse1" }
  ],
  "flowId": "56c74add04d0b50100043381"
}
```
