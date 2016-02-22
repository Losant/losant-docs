# Function Node

The function node allows a user defined javascript to operate on the current payload.

![Function Node](/images/workflows/logic/function-node.png "Function Node")

## Configuration

The function node has a single configuration block - the user defined javascript code to execute.  Only base javascript functionality is available for the execution of this code - no external libraries or modules are available for use. The current payload of the workflow is available at the variable `payload`, and can be treated as a normal javascript object.

![Function Node Config](/images/workflows/logic/function-node-config.png "Function Node Config")

In the above example, the function node is averaging the values of an array of data, and storing that average in the payload field `data.average`.

## Payload Modification

There are two ways a function node can modify the current workflow payload.

First, if a return statement is hit and something is returned, that returned value is used as the new payload.  For example:

```JavaScript
return { value: "Total Replacement" };
```

If that was the entire contents of a function node, no matter what the original payload was, the payload after the execution of the function node would always be the object:

```JSON
{ "value": "Total Replacement" }
```

The other way to change the payload is to modify the existing payload object.  If a return statement is used but no value is returned, or if no return statement is used at all in the function node, the value of the `payload` variable at the end of the function node's execution is used as the new payload.  So, with the example function node code of:

```JavaScript
payload.data.newItem = "Something Special";
payload.data.oldNumber = payload.oldNumber + 1;
```

And an example payload of:

```JSON
{
  ...
  "data":{
    "oldNumber": 5
  }
  ...
}
```

The payload after the execution of that function node would be:

```JSON
{
  ...
  "data":{
    "newItem": "Something Special",
    "oldNumber": 6
  }
  ...
}
```
