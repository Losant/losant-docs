---
flowclass:
  - Application
  - Experience
description: 'Learn more about the Losant Device: Get Node.'
---

# Device: Get Node

The Device: Get Node allows a workflow to retrieve one or more [devices](/devices/overview/) from the current application and add them to the current workflow payload.

![Get Device Node](/images/workflows/data/get-device-node.png "Get Device Node")

## Node Properties

The configuration for the Device: Get Node requires a query method and parameters to find a device connected to Losant.

### Query Method

The first step is selecting the a query method to use to find a device or group of devices. The Device: Get Node has three query options:

- Device ID: You can input a specific device's ID to retrieve it or use a value on the payload. The ID can be hardcoded in the workflow editor or derived from a property on the current payload.

- Device Name:You can input a specific device's name to retrieve it or use a value on the payload. The name can be hardcoded in the workflow editor or derived from a property on the current payload.

- Tag Query: You can set specific tag key/value pairs to retrieve one or more devices. Any device(s) returned will match all tags in the query. If a key is set without a value, any device that has that key set regardless of the value will be returned. (And vice-versa for values set without keys.) Tags can be hardcoded or derived from a property on the current payload.

### Configuration

Depending on the query method selected, you will be able to input the specific Device ID, Device Name, or the tag key/value pairs to find a device or group of devices.

### Result Path

Specify where on the payload path you want the device or group of devices to be stored.

For the Device ID and Device Name queries, the result will either be the device object or null if no device is found.

For the Tag Query, the result will either be an array of device objects or an empty array.

You also have the option of changing the form of the tags on the device result. By default it is the standard array of key/value pairs (the same as the Losant API returns) - but you can instead ask for the tags to be in the form of an object map, where the tags property will be an object. In that case, each tag key will be a property on the object, and the value of that property will be an array of all the tag values for that key on the device. This is often an easier form to work with inside of workflows.

In addition, you can ask for a composite of the last known state of each attribute of the device to be included as well, which will be added to the device under the `compositeState` field.

## Node Throttling and Limits

_TODO: I'm not sure what the throttling and limits of this node are._

## Node Example

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

## Node Errors

For the Device ID and Device Name queries, the result will either be the device object or null if no device is found.

For the Tag Query, the result will either be an array of device objects or an empty array.

## Related Nodes

- [Device: Create](http://127.0.0.1:8000/workflows/data/create-device/)
- [Device: Update](http://127.0.0.1:8000/workflows/data/update-device/)
- [Device: Delete](http://127.0.0.1:8000/workflows/data/delete-device/)
