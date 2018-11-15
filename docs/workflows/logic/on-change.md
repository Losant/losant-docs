flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant On Change Node.

# On Change Node

The On Change Node allows a workflow to branch based upon if a value has changed since previous executions of the workflow.

![On Change Node](/images/workflows/logic/on-change-node.png "On Change Node")

## Configuration

There are three configuration parts for the On Change Node - defining what payload field to monitor for changes, defining what constitutes a change, and optionally defining where to store the value compared against.

![On Change Node Example](/images/workflows/logic/on-change-node-example.png "On Change Node Example")

If the payload field being monitored for changes does in fact change between workflow runs, the route on the right out of the On Change Node is taken. If the payload field has not changed, the route on the left out of the On Change Node is taken. In addition, if this is first time that the field is being monitored (i.e., there is not a previous value to compare against), the route on the left out of the On Change Node is taken.

### Field to monitor

![On Change Node Field To Monitor](/images/workflows/logic/on-change-node-field-to-monitor.png "On Change Node Field To Monitor")

The field to monitor is a [payload path](/workflows/accessing-payload-data/#payload-paths) to a value in the payload. In the above example, the value of the field `data.color` in the payload is what will be compared across workflow runs. If the field does not exist, the value that will be compared against will be `undefined`.

### The Type of Change

There are seven different ways that a "change" can be defined, and those can be broken into the following 3 groups.

#### Equality Comparison

![On Change Node Any Change](/images/workflows/logic/on-change-node-any-change.png "On Change Node Any Change")

##### Any Change

The `Any Change` type is the most commonly used. The can be used with any data type, or even across data types if the type of data in the field being monitored sometimes changes. If the value in the field is different in any way from the previous workflow run, it counts as a change.

#### Numerical Comparison

![On Change Node Numerical Change](/images/workflows/logic/on-change-node-numerical-change.png "On Change Node Numerical Change")

Unlike the "Any Change" type of comparison, the numerical comparisons require a threshold value. This is because these change comparison types calculate the difference between the current value and the previous value. As one might expect, the values being compared for these change types must be numbers (or able to be cast to numbers). If they are not numbers, the "no change" path out of the node is always taken.

##### Change Of At Least

The `Change of at least` type will trigger whenever the value to check against has changed by at least the specified threshold vs the previous value that triggered. The previous value is updated only when a value triggers the node.

##### Increase Of At Least

The `Increase of at least` type will trigger whenever the value to check against has increased by at least the specified threshold vs the minimum value since the last time the node triggered. The previous value is updated either when a value triggers the node or when a value is smaller than the currently stored previous value.

##### Decrease Of At Least

The `Decrease of at least` type will trigger whenever the value to check against has decreased by at least the specified threshold vs the maximum value since the last time the node triggered. The previous value is updated either when a value triggers the node or when a value is larger than the currently stored previous value.

#### Percentage Comparison

![On Change Node Percent Change](/images/workflows/logic/on-change-node-percent-change.png "On Change Node Percent Change")

The percentage comparison types are very similar to the numerical comparison types, except instead of calculating the exact difference between the old and current values, it calculates the percentage difference. So in the case of percentage comparison, the threshold value is treated as a percentage. And just like the numerical comparison types, the percentage comparison types expect the values being compares to be numbers. If they are not numbers, the "no change" path out of the node is always taken.

##### Percent Change Of At Least

The `Percent change of at least` type will trigger whenever the value to check against has changed by at least the specified threshold (as a percentage) vs the previous value that triggered. The previous value is updated only when a value triggers the node.

##### Percent Increase Of At Least

The `Percent increase of at least` type will trigger whenever the value to check against has increased by at least the specified threshold (as a percentage) vs the minimum value since the last time the node triggered. The previous value is updated either when a value triggers the node or when a value is smaller than the currently stored previous value.

##### Percent Decrease Of At Least

The `Percent decrease of at least` type will trigger whenever the value to check against has decreased by at least the specified threshold (as a percentage) vs the maximum value since the last time the node triggered. The previous value is updated either when a value triggers the node or when a value is larger than the currently stored previous value.

### Adding The Previous Value To the Payload

![On Change Node Previous Value](/images/workflows/logic/on-change-node-previous-value.png "On Change Node Previous Value")

The On Change Node has the ability to optionally add information about the previous value being compared against to the payload at a defined [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the previous value and time at which that value ran through the workflow will be placed at that path no matter which branch out of the On Change Node is taken. If there is no previous value that was compared against (i.e., this is the first time this field is being checked), then nothing will be added to the payload. In the above example, the previous value information will be placed at the `data.previousColor` path. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393,
  },
  ...
}
```

The payload after execution of the On Change Node might look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393,
    "previousColor": {
      "value": 1475,
      "time": 1455838590449
    }
  },
  ...
}
```

## Advanced Options

The On Change Node also has an optional field named `On Change Identifier`. This field is a [string template](/workflows/accessing-payload-data/#string-templates) and can be used to make a single On Change Node function as the equivalent of multiple on change checks. For example, if multiple devices can trigger a workflow and pass through this On Change Node, you can have the on change identifier be the triggering device ID. That way the On Change Node will trigger on a per-device basis, instead of on a global workflow basis.
