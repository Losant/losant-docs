---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: 'Learn more about the Losant Storage: Get Value Node.'
---

# Storage: Get Value Node

The Storage: Get Value Node allows a workflow to retrieve a value stored in a previous run of the workflow by the [Storage: Set Value Node](/workflows/data/store-value/). Stored values can also be viewed and manipulated using the [workflow storage tab](/workflows/overview/#workflow-storage).

![Storage Get Value Node](/images/workflows/data/get-value-node.png "Storage Get Value Node")

## Configuration

There are three configuration properties for the Storage: Get Value Node - an identifier, a [payload path](/workflows/accessing-payload-data/#payload-paths), and an optional default value.

The identifier is a [string template](/workflows/accessing-payload-data/#string-templates) for identifying value to retrieve - and while it can be an arbitrary string, it should match the identifier of a previously stored value - i.e., the identifier used in the configuration of a [Storage: Set Value Node](/workflows/data/store-value/).

The [payload path](/workflows/accessing-payload-data/#payload-paths) defines where the workflow should place the retrieved value on the current payload. The optional default value is only used if there is no value previously stored with the specified identifier - in which case, the specified default value is placed on the payload instead. When defining the default value, you must first choose a "Default Value Type", which allows for setting the value as a [payload path](/workflows/accessing-payload-data/#payload-paths), [string template](/workflows/accessing-payload-data/#string-templates) or [JSON template](/workflows/accessing-payload-data/#json-templates).

![Storage Get Value Node Example](/images/workflows/data/get-value-node-example.png "Storage Get Value Node Example")

In the above example, the workflow will fetch the value stored under the identifier `storedColor`, and will place that value in the current payload at the path `data.color`. If there is no value stored under `storedColor`, the workflow will place `0` in `data.color` instead. So, in the case that the value `12562` was stored under the `storedColor` identifier and the workflow was executed with the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": { },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Light Wall",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "deviceTags": { },
  "deviceName": "Ranger",
  "globals": { },
  "flowId": "56c794a06895b00100cbe84c",
  "flowName": "Range To Color"
}
```

The payload after the execution of the Storage: Get Value Node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "color": 12562
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Light Wall",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "deviceTags": { },
  "deviceName": "Ranger",
  "globals": { },
  "flowId": "56c794a06895b00100cbe84c",
  "flowName": "Range To Color"
}
```
