# On Change Node

The on change node allows a workflow to branch based upon if a value has changed since previous executions of the workflow.

![On Change Node](/images/workflows/logic/on-change-node.png "On Change Node")

## Configuration

There are three configuration parts for the on change node - defining what payload field to monitor for changes, defining what constitutes a change, and optionally defining where to store the value compared against.

![On Change Node Example](/images/workflows/logic/on-change-node-example.png "On Change Node Example")

If the payload field being monitored for changes does in fact change between workflow runs, the route on the right out of the on change node is taken.  If the payload field has not changed, the route on the left out of the on change node is taken.  In addition, if this is first time that the field is being monitored (i.e., there is not a previous value to compare against), the route on the left out of the on change node is taken.

### Field to monitor

![On Change Node Field To Monitor](/images/workflows/logic/on-change-node-field-to-monitor.png "On Change Node Field To Monitor")

The field to monitor is a [payload path](/workflows/accessing-payload-data/#payload-paths) to a value in the payload.  In the above example, the value of the field `data.color` in the payload is what will be compared across workflow runs.  If the field does not exist, the value that will be compared against will be `undefined`.

### The Type of Change

There are seven different ways that a "change" can be defined, and those can be broken into the following 3 groups.

#### Equality Comparison

![On Change Node Any Change](/images/workflows/logic/on-change-node-any-change.png "On Change Node Any Change")

*   Any change

The "Any Change" type is the most commonly used.  The can be used with any data type, or even across data types if the type of data in the field being monitored sometimes changes.  If the value in the field is different in any way from the previous workflow run, it counts as a change.

#### Numerical Comparison

![On Change Node Numerical Change](/images/workflows/logic/on-change-node-numerical-change.png "On Change Node Numerical Change")

*   Change of at least - changes in either direction count
*   Increase of at least - only changes in a positive direction count
*   Decrease of at least - only changes in a negative direction count

Unlike the "Any Change" type of comparison, the numerical comparison require a threshold value.  This is because these change comparison types calculate the difference between the current value and the previous value, and if the change is greater than the specified threshold, it counts as a change.  As one might expect, the values being compared for these change types must be numbers (or able to be cast to numbers).  If they are not numbers, the "no change" path out of the node is always taken.

#### Percentage Comparison

![On Change Node Percent Change](/images/workflows/logic/on-change-node-percent-change.png "On Change Node Percent Change")

*   Percent change of at least - changes in either direction count
*   Percent increase of at least - only changes in a positive direction count
*   Percent decrease of at least - only changes in a negative direction count

The percentage comparison types are very similar to the numerical comparison types, except instead of calculating the exact difference between the old and current values, it calculates the percentage difference.  So in the case of percentage comparison, the threshold value is treated as a percentage.  And just like the numerical comparison types, the percentage comparison types expect the values being compares to be numbers. If they are not numbers, the "no change" path out of the node is always taken.

### Adding The Previous Value To the Payload

![On Change Node Previous Value](/images/workflows/logic/on-change-node-previous-value.png "On Change Node Previous Value")

The on change node has the ability to optionally add information about the previous value being compared against to the payload at a defined [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the previous value and time at which that value ran through the workflow will be placed at that path no matter which branch out of the on change node is taken.  If there is no previous value that was compared against (i.e., this is the first time this field is being checked), then nothing will be added to the payload.  In the above example, the previous value information will be placed at the `data.previousColor` path. So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393,
  },
  ...
}
```

The payload after execution of the on change node might look like:

```JSON
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

The On Change node also has an optional field named `On Change Identifier`. This field is a [string template](/workflows/accessing-payload-data/#string-templates) and can be used to make a single on change node function as the equivalent of multiple on change checks. For example, if multiple devices can trigger a workflow and pass through this on change node, you can have the on change identifier be the triggering device ID. That way the on change node will trigger on a per-device basis, instead of on a global workflow basis.
