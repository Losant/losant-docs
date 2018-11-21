flowclass: Application
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant JSON Decode Node.

# JSON Decode Node

The JSON Decode Node allows a workflow to decode a JSON string into an object on the payload.

![JSON Decode Node](/images/workflows/logic/json-decode-node.png "JSON Decode Node")

## Configuration

There are two configuration properties for the JSON Decode Node - the [payload path](/workflows/accessing-payload-data/#payload-paths) to the string to decode, and the payload path for where to store the resulting decoded object. Both paths are allowed to be the same, in which case the JSON string will be replaced by the decoded object.

![JSON Decode Node Config](/images/workflows/logic/json-decode-node-config.png "JSON Decode Node Config")

In the above example, the workflow will decode the string at the `container.jsonString` path and place the resulting object at the `container.jsonObject` path. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "container": {
    "jsonString": "{\"messageBody\":[12,24],\"name\":\"Trigger52\"}"
  },
  ...
}
```

The payload after execution of the JSON Decode Node would look like:

```json
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
