# Throttle Node

The throttle node allows a workflow to branch based upon the amount of time that has passed since the last time the throttle node was executed.  In the simple and common use case, it can be used to throttle a workflow to only run a certain number of times per time period.

![Throttle Node](/images/workflows/logic/throttle-node.png "Throttle Node")

## Configuration

The throttle node is configured by specifying the rate of executions of the node per time period.  The available time periods are "Second", "Minute", "Hour", and "Day", and the rate is allowed to be anything above 0 and below 10 times per second.  If enough time has passed between the last un-throttled execution of the throttle node, the right (un-throttled) route out of the node is taken.  If not enough time has passed (i.e., the number of executions has exceeded to specified rate), the left (throttled) route out of the node is taken.

![Throttle Node Example](/images/workflows/logic/throttle-node-example.png "Throttle Node Example")

In the above example, the workflow will follow the right route out of the throttle node and proceed to send a device command only if it has been at least a minute since the last time the workflow went down that route.  If it has been less than a minute, the workflow follows the left route - and since there is no node attached to the left route, the execution of the flow stops.

## Adding Time Since

![Throttle Node Time Since](/images/workflows/logic/throttle-node-time-since.png "Throttle Node Time Since")

The throttle node has the ability to optionally add the amount of time that has passed since an un-throttled execution of the node to the payload at an arbitrary JSON path.  If a path is defined, the amount of time (in milliseconds) will be placed at that path no matter which branch out of the throttle node is taken.  In the above example, the amount of time will be placed at the `data.timeSinceLastCommand` path.  So for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c74add04d0b50100043381",
  "triggerType": "deviceId",
  "flowId": "5661f1330ae2980100894f45"
}
```

The payload after execution of the throttle node could look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393,
    "timeSinceLastCommand": 27551
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c74add04d0b50100043381",
  "triggerType": "deviceId",
  "flowId": "5661f1330ae2980100894f45"
}
```
