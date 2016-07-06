# Get Value Node

The get value node allows a workflow to retrieve a value stored in a previous run of the workflow by the [store value node](/workflows/data/store-value/).  Stored values can also be viewed and manipulated using the [workflow storage tab](/workflows/overview/#workflow-storage).

![Get Value Node](/images/workflows/data/get-value-node.png "Get Value Node")

## Configuration

There are three configuration properties for the get value node - an identifier, a payload path, and an optional default value. The identifier is how the workflow knows what value to retrieve - and while it can be an arbitrary string (and is templateable), it should match the identifier of a previously stored value - i.e., the identifier used in the configuration of a [store value node](/workflows/data/store-value/).  The payload path is a JSON path which defines where the workflow should place the retrieved value on the current payload.  The optional default value is only used if there is no value previously stored with the specified identifier - in which case, the specified default value is placed on the payload instead. There are a couple choices for configuring the default value:

*   With **Payload Path**, what should be provided is a json path - and the node will evaluate that path against the current payload to determine the default value to use.
*   **Template** means the value will be evaluated as a standard templatable field, and the result will be the default value to use.
*   **JSON** means the value will be treated as static JSON, and the resulting JSON parsed object will be what will be used as the default value.  Using this choice, you can set static complex objects as the value, or even just simple values like true or false.  This is the default choice, and the default JSON to use will be null.

![Get Value Node Example](/images/workflows/data/get-value-node-example.png "Get Value Node Example")

In the above example, the workflow will fetch the value stored under the identifier `storedColor`, and will place that value in the current payload at the path `data.color`.  If there is no value stored under `storedColor`, the workflow will place `0` in `data.color` instead.  So, in the case that the value `12562` was stored under the `storedColor` identifier and the workflow was executed with the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": { },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```

The payload after the execution of the get value node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "color": 12562
  },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56c794a06895b00100cbe84c"
}
```
