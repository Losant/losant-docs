flowclass: Edge 1.2.0
description: Learn more about the Losant UDP Trigger.

# UDP Trigger

The UDP Trigger will trigger a workflow whenever the [edge compute device](/devices/edge-compute/) receives a UDP datagram on the configured port.

![UDP Trigger](/images/workflows/triggers/udp-trigger.png "UDP Trigger")

## Configuration

The UDP Trigger has one piece of configuration, the port to listen on. When a workflow with this trigger is deployed to an [Edge Compute](/devices/edge-compute/) device, the Edge Agent will open a UDP server on this port. When that UDP server receives a datagram, the workflow will trigger.

## Payload

The payload will include the triggering datagram `data` field. In the general case, a UDP workflow payload will look like the following:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "data": {
    "sourcePort": <source port of incoming datagram>,
    "sourceAddress": <source address of incoming datagram>,
    "message": <contents of the incoming datagram>
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
  "triggerId": <udp port>,
  "triggerType": "udp"
}
```
