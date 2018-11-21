flowclass: Application
flowclass: Experience
description: Learn more about the Losant Device: Get Node.

# Device: Get Node

The get device node allows a workflow to retrieve one or more [devices](/devices/overview/) from the current application and add them to the current workflow payload.

![Get Device Node](/images/workflows/data/get-device-node.png "Get Device Node")

## Configuration

There are three ways to query for devices using this node - by device ID, device name, or by tags. Any and all fields are [templatable](/workflows/accessing-payload-data/#string-templates) and can be pulled off of the current workflow payload.

- When querying by device ID, the configuration expects a single device ID.
- When querying by device name, only a full and exact match on the device name will yield a single result.
- When querying by device tags, the configuration expects one or more tag key/value pairs, and **all** of the pairs have to match the device in order for the device to be returned by the query. The same rules apply here that apply to tag queries in the rest of Losant - if a key is provided but no value, any device with that tag key will match (and value will not matter), and if a value is provided but no key, any device with that tag value will match (and key will not matter).

When querying by device ID or device name, there will at most be a single device that matches, so the return will never be an array. When querying by tags, you have the option of just returning the first device match (if you know that there should only be a single device), but can also return an array of devices that match.

![Get Device Node Configuration](/images/workflows/data/get-device-node-config.png "Get Device Node Configuration")

The query result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) provided in the `Result Path` field. If the query is configured to potentially return multiple results, this will always be an array, even if no results are found. If the query is only returning a single result, this will either be the device object or will be `null`. You also have the option of changing the form of the tags on the device result. By default it is the standard array of key/value pairs (the same as the Losant API returns) - but you can instead ask for the tags to be in the form of an object map, where the tags property will be an object. In that case, each tag key will be a property on the object, and the value of that property will be an array of all the tag values for that key on the device. This is often an easier form to work with inside of workflows. In addition, you can ask for a composite of the last known state of each attribute of the device to be included as well, which will be added to the device under the `compositeState` field.

![Get Device Node Result](/images/workflows/data/get-device-node-config-result.png "Get Device Node Result")

In the example above, the workflow will retrieve the device that has the `sigfox_id` tag matching the value at `data.body.device` on the payload. It is only expecting a single device to be returned, and will place the resulting device at `data.losantDevice` with the tags in object form and the most recent composite state. For example, the payload after the Get Device node runs might look like the following:

```json
{
  "data": {
    "body": {
      "device": "AA00FF",
      ...
    },
    "losantDevice": {
      "id": "56c794a06895b00100cbe84c",
      "name": "Sigfox Device",
      "deviceClass": "standalone",
      "tags": {
        "sigfox_id": ["AA00FF"]
      },
      "attributes": [
        { "name": "temp", "dataType": "number" },
        { "name": "humidity", "dataType": "number" }
      ],
      "compositeState": {
        "temp": {
          "time": Thu Aug 16, 2018 10:17:36 GMT-04:00,
          "value": "15.6",
          "relayId": "56c8967bb8df0f0100d62912",
          "relayType": "flow"
        },
        "humidity": {
          "time": Thu Aug 16, 2018 10:10:36 GMT-04:00,
          "value": "0.67",
          "relayId": "56c8967bb8df0f0100d62912",
          "relayType": "flow"
        }
      }
      ...
    },
    ...
  },
  ...
}
```
