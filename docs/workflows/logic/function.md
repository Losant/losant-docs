---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant Function Node.
---

# Function Node

The Function Node allows a user defined JavaScript to operate on the current payload.

![Function Node](/images/workflows/logic/function-node.png "Function Node")

## Configuration

The Function Node has a single configuration block - the user defined JavaScript code to execute. Only base JavaScript functionality is available for the execution of this code - no external libraries or modules are available for use. The current payload of the workflow is available at the variable `payload`, and can be treated as a normal JavaScript object.

![Function Node Config](/images/workflows/logic/function-node-config.png "Function Node Config")

In the above example, the Function Node is averaging the values of an array of data, and storing that average in the payload field `data.average`.

## Payload Modification

There are two ways a Function Node can modify the current workflow payload.

First, if a return statement is hit and something is returned, that returned value is used as the new payload. For example:

```javascript
return { value: "Total Replacement" };
```

If that were the entire contents of a Function Node, no matter what the original payload was, the payload after the execution of the Function Node would always be the object:

```json
{ "value": "Total Replacement" }
```

The other way to change the payload is to modify the existing payload object. If a return statement is used but no value is returned, or if no return statement is used at all in the node, the value of the `payload` variable at the end of the node's execution is used as the new payload. So, with the example Function Node code of:

```javascript
payload.data.newItem = "Something Special";
payload.data.oldNumber = payload.oldNumber + 1;
```

And an example payload of:

```json
{
  ...
  "data":{
    "oldNumber": 5
  }
  ...
}
```

The payload after the execution of that Function Node would be:

```json
{
  ...
  "data":{
    "newItem": "Something Special",
    "oldNumber": 6
  }
  ...
}
```
