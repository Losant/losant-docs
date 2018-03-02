flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant Throttle Node.

# Throttle Node

The Throttle Node allows a workflow to branch based upon the amount of time that has passed since the last time the Throttle Node was executed. In the simple and common use case, it can be used to throttle a workflow to only run a certain number of times per time period.

![Throttle Node](/images/workflows/logic/throttle-node.png "Throttle Node")

## Configuration

The Throttle Node is configured by specifying the rate of executions of the node per time period. The available time periods are "Second", "Minute", "Hour", and "Day", and the rate is allowed to be anything above 0 and below 10 times per second. If enough time has passed between the last un-throttled execution of the Throttle Node, the right (un-throttled) route out of the node is taken. If not enough time has passed (i.e., the number of executions has exceeded to specified rate), the left (throttled) route out of the node is taken.

![Throttle Node Example](/images/workflows/logic/throttle-node-example.png "Throttle Node Example")

In the above example, the workflow will follow the right route out of the Throttle Node and proceed to send a device command only if it has been at least a minute since the last time the workflow went down that route. If it has been less than a minute, the workflow follows the left route - and since there is no node attached to the left route, the execution of the flow stops.

## Adding Time Since

![Throttle Node Time Since](/images/workflows/logic/throttle-node-time-since.png "Throttle Node Time Since")

The Throttle Node has the ability to optionally add the amount of time that has passed since an un-throttled execution of the node to the payload at an arbitrary [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the amount of time (in milliseconds) will be placed at that path no matter which branch out of the Throttle Node is taken. In the above example, the amount of time will be placed at the `data.timeSinceLastCommand` path. So for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393
  },
  ...
}
```

The payload after execution of the Throttle Node could look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393,
    "timeSinceLastCommand": 27551
  },
  ...
}
```

## Advanced Options

The Throttle Node also has an optional field named `Throttle Identifier`. This field is a [string template](/workflows/accessing-payload-data/#string-templates) and can be used to make a single Throttle Node function as the equivalent of multiple throttle checks. For example, if multiple devices can trigger a workflow and pass through this Throttle Node, you can have the throttle identifier be the triggering device ID. That way the on throttle will work on a per-device basis, instead of on a global workflow basis.
