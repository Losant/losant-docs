# Math Node

The math node allows a workflow to perform an arbitrary number of calculations and store their results in the payload.

![Math Node](/images/workflows/logic/math-node.png "Math Node")

## Configuration

Math nodes are configured by creating "statements", and each statement has two values to configure.  First is the expression, which is what is actually evaluated, and uses the same syntax as the [conditional node expressions](/workflows/logic/conditional/). Second is the result path, which is a JSON path describing where on the payload the result from evaluating the expression should be stored.  A math node can have an arbitrary number of these "statements", and they are executed in order from first to last - which means that subsequent statements can use the results of previous statements if desired.

![Math Node Config](/images/workflows/logic/math-node-config.png "Math Node Config")

In the above example, the workflow will take the value in the `data.voltage` field of the payload, divide it by 80, multiple it by 65535, and store the resulting value in the `data.color` field of the payload.  So, for example, given the payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c74add04d0b50100043381",
  "triggerType": "deviceId",
  "flowId": "5661f1330ae2980100894f45"
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
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c74add04d0b50100043381",
  "triggerType": "deviceId",
  "flowId": "5661f1330ae2980100894f45"
}
```

## Expression Variable Replacement

Values in the expression that are surrounded by double curly braces (`{{ value }}`) are treated as JSON paths and are evaluated against the payload to find the actual value for the evaluation of the expression.  See the workflow [JSON Path documentation](/workflows/overview/#template-fields-and-payload-paths) for more details.

## Expression Details

Math node expression support is identical to conditional node expression support - except that instead of using the result to branch, the result is stored in the payload.  So for details on what exactly is supported within an expression please refer to the [expression details section of the conditional node documentation](/workflows/logic/conditional/#expression-details).
