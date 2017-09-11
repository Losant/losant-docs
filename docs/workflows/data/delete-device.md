# Device: Delete Node

The Delete Device node allows a workflow to remove a [Device](/devices/overview/) inside the current application.

![Delete Device Node](/images/workflows/data/delete-device-node.png "Delete Device Node")

## Configuration

To find the device to delete, the node requires the device ID. This field is  [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a device based on the current workflow payload.

This node can only delete one device at a time, so the return value from the template must be a single device ID.

![Delete Device Node Configuration](/images/workflows/data/delete-device-node-config.png "Delete Device Node Configuration")

Optionally you can provide a payload path in the "Result Path" field so that the delete device result can be placed at that path on the current workflow payload. In the case of a successful device deletion, this will be true, and in the case of a failed device deletion this will be an object of any errors about the deletion of the device.

![Delete Device Node Result](/images/workflows/data/delete-device-node-result.png "Delete Device Node Result")

For instance, given the example node configuration in the screenshots above, this is a possible result for a successful device deletion:

```json
{
  "data": {
    "deviceId": "589de7d2a1975a00017b227f",
    "losantDevice": true
    ...
  },
  ...
}
```
