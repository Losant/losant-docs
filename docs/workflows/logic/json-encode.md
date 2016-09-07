# JSON Encode Node

The JSON encode node allows a workflow to encode an object on the payload into a JSON string.

![JSON Encode Node](/images/workflows/logic/json-encode-node.png "JSON Encode Node")

## Configuration

There are two configuration properties for the JSON encode node - the JSON path to the object to encode, and the JSON path for where to store the resulting JSON encoded string.  Both paths are allowed to be the same, in which case the object will be replaced by the JSON string.

![JSON Encode Node Config](/images/workflows/logic/json-encode-node-config.png "JSON Encode Node Config")

In the above example, the workflow will encode the value at the `container.jsonObject` path and place the resulting string at the `container.jsonString` path.  So, for example, given the following payload:

```JSON
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

The payload after execution of the JSON encode node would look like:

```JSON
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
