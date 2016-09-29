# Math Node

The math node allows a workflow to perform an arbitrary number of calculations and store their results in the payload.

![Math Node](/images/workflows/logic/math-node.png "Math Node")

## Configuration

Math nodes are configured by creating "statements", and each statement has two values to configure.  First is the [expression](/workflows/accessing-payload-data/#expressions), which is what is actually evaluated. Second is the result path, which is a [payload path](/workflows/accessing-payload-data/#payload-paths) describing where on the payload the result from evaluating the expression should be stored.  A math node can have an arbitrary number of these "statements", and they are executed in order from first to last - which means that subsequent statements can use the results of previous statements if desired.

![Math Node Config](/images/workflows/logic/math-node-config.png "Math Node Config")

In the above example, the workflow will take the value in the `data.voltage` field of the payload, divide it by 80, multiple it by 65535, and store the resulting value in the `data.color` field of the payload. So, for example, given the payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7
  },
  ...
}
```

The payload after execution of the math node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393
  },
  ...
}
```

## Expression Details

Unlike most other places where [expressions](/workflows/accessing-payload-data/#expressions) appear in the platform, where (for example) the result is evaluated as truthy or falsy to decide a workflow path, the value returned from the math node is stored on the payload. Refer to the [supported operators](/workflows/accessing-payload-data/#supported-operators) for more details.
