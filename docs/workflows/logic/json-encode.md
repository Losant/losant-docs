flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant JSON Encode Node.

# JSON Encode Node

The JSON Encode Node allows a workflow to encode an object on the payload into a JSON string.

![JSON Encode Node](/images/workflows/logic/json-encode-node.png "JSON Encode Node")

## Configuration

There are two configuration properties for the JSON Encode Node - the [payload path](/workflows/accessing-payload-data/#payload-paths) to the JSON object to encode, and the path for where to store the resulting JSON-encoded string. Both paths are allowed to be the same, in which case the object will be replaced by the JSON string.

![JSON Encode Node Config](/images/workflows/logic/json-encode-node-config.png "JSON Encode Node Config")

In the above example, the workflow will encode the value at the `container.jsonObject` path and place the resulting string at the `container.jsonString` path. So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "container": {
    "jsonObject": {
      "messageBody": [
        12,
        24
      ],
      "messageName": "Trigger52"
    }
  ...
}
```

The payload after execution of the JSON Encode Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "container": {
    "jsonString": "{\"messageBody\":[12,24],\"messageName\":\"Trigger52\"}",
    "jsonObject": {
      "messageBody": [
        12,
        24
      ],
      "messageName": "Trigger52"
    }
  },
  ...
}
```
