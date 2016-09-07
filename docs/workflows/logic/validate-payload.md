# Validate Payload Node

The validate payload node allows a workflow check the current payload against a JSON schema, and branch depending on if the payload passes validation or not.

![Validate Payload Node](/images/workflows/logic/validate-payload-node.png "Validate Payload Node")

## Configuration

The validate payload node is configured using a [JSON Schema](http://spacetelescope.github.io/understanding-json-schema/index.html) definition.  The current payload of the workflow is validated against the given JSON schema, and if it passes validation the route on the right out of the node is taken.  If it fails validation, the route on the left out of the node is taken.

![Validate Payload Example](/images/workflows/logic/validate-payload-example.png "Validate Payload Example")

Here is the full schema from the above screenshot in an easier to read form:

```JSON
{
  "type": "object",
  "properties": {
    "data": {
      "type": "object",
      "properties": {
        "voltage": {
          "type": "number",
          "minimum": 0,
          "maximum": 5
        }
      },
      "required": [
        "voltage"
      ]
    }
  }
}
```

In the above example, the workflow will follow the route on the right out of the validate payload node and proceed to the math node only if the payload has a `data.voltage` field which has a number between 0 and 5.

So the following payload would pass validation, and the workflow would take the route on the right and move on to the math node:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7
  },
  ...
}
```

But this next payload would not pass validation, and so the workflow would take the route on the left - which in the example above goes nowhere, and so the current execution of the workflow would stop:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": "not a number"
  },
  ...
}
```
