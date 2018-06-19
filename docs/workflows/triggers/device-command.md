flowclass: Edge 1.0.0
description: Learn more about the Losant Device Command Trigger.

# Device Command Trigger

The Device Command Trigger will trigger a workflow whenever the [edge compute device](/devices/edge-compute/) receives a [command](/devices/commands/).

![Device Command Trigger](/images/workflows/triggers/device-command-trigger.png "Device Command Trigger")

## Configuration

The Device Command Trigger has no configuration. When a workflow with this trigger is deployed to an [Edge Compute](/devices/edge-compute/) device, if that device receives a command, the workflow will fire.

## Payload

The payload will include the triggering device command on the `data` field. In the general case, a device command workflow payload will look like the following:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "data": {
    "name": <name of the command>,
    "payload": {
      "your": "custom",
      "command": "values",
      ...
    },
    "time": <time of the command>
  },
  "deviceId": <id of the edge device>,
  "deviceName": <the edge device name>,
  "deviceTags": {<any tags for the edge device>},
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <name of the current workflow version>,
  "globals": <object of workflow globals>,
  "isConnectedToLosant": <if the agent is connected to Losant>,
  "agentEnvironment": <object of environment variables>,
  "time": <time the command arrived>,
  "triggerId": "deviceCommand",
  "triggerType": "deviceCommand"
}
```
