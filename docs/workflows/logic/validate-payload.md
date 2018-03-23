flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant Validate Payload Node.

# Validate Payload Node

The Validate Payload Node allows a workflow check the part or all of current payload against a JSON schema, and branch depending on if the payload passes validation or not.

![Validate Payload Node](/images/workflows/logic/validate-payload-node.png "Validate Payload Node")

## Configuration

The Validate Payload Node is configured using a [JSON Schema](http://spacetelescope.github.io/understanding-json-schema/index.html) definition. A part of or all of the current payload of the workflow is validated against the given JSON schema, and if it passes validation the route on the right out of the node is taken. If it fails validation, the route on the left out of the node is taken.

In <span class="flowclass-tag Cloud inline">Cloud</span> and <span class="flowclass-tag Edge inline">Edge >= 1.1.0</span> workflows, the schema can be defined using either a [payload path](/workflows/accessing-payload-data/) or a [JSON template](/workflows/accessing-payload-data/#json-templates). For legacy edge workflows, the schema must be defined as a static object within the node.

![Validate Payload Example](/images/workflows/logic/validate-payload-example.png "Validate Payload Example")

In the above example, the node is validating the `data` property of the payload against a scheme. Here is the full schema from the above screenshot in an easier to read form:

```json
{
  "type": "object",
  "properties": {
    "voltage": {
      "type": "number",
      "minimum": 0,
      "maximum": 5
    }
  },
  "required": ["voltage"]
}
```

The workflow will follow the route on the right out of the Validate Payload Node and proceed to the [Math Node](/workflows/logic/math/) only if the payload has a `data.voltage` field whose value is a number between 0 and 5.

So the following payload would pass validation, and the workflow would take the route on the right and move on to the Math Node:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7
  },
  ...
}
```

But this next payload would not pass validation, and so the workflow would take the route on the left - which in the example above goes nowhere, and so the current execution of the workflow would stop:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": "not a number"
  },
  ...
}
```

![Validate Payload Errors](/images/workflows/logic/validate-payload-error.png "Validate Payload Errors")

Optionally, any errors from validating the payload can be placed on the payload at a payload path. If this path is provided and there are no errors, the value at the path will be set as an empty array. If there are in fact errors, it will be an array of error objects. For example, in the "not a number" payload case above, if the error path was set to `data.validationErrors`, the payload after the Validate Payload Node would look like the following:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": "not a number",
    "validationErrors": [
      {
        "field": "data.voltage",
        "message": "is the wrong type"
      }
    ]
  },
  ...
}
```
