# JSON Decode Node

The JSON decode node allows a workflow to decode a JSON string into an object on the payload.

![JSON Decode Node](/images/workflows/logic/json-decode-node.png "JSON Decode Node")

## Configuration

There are two configuration properties for the JSON decode node - the JSON path to the string to decode, and the JSON path for where to store the resulting decoded object.  Both paths are allowed to be the same, in which case the JSON string will be replaced by the decoded object.

![JSON Decode Node Config](/images/workflows/logic/json-decode-node-config.png "JSON Decode Node Config")

In the above example, the workflow will decode the string at the `container.jsonString` path and place the resulting object at the `container.jsonObject` path.  So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "container": {
    "jsonString": "{\"messageBody\":[12,24],\"name\":\"Trigger52\"}"
  },
  ...
}
```

The payload after execution of the JSON decode node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "container": {
    "jsonString": "{\"messageBody\":[12,24],\"name\":\"Trigger52\"}",
    "jsonObject": {
      "messageBody": [
        12,
        24
      ],
      "name": "Trigger52"
    }
  },
  ...
}
```
