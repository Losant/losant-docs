# Device: Update Node

The Update Device node allows a workflow to update an existing [Device](/devices/overview/) inside the current application, and optionally add the updated device to the current workflow payload.

![Update Device Node](/images/workflows/data/update-device-node.png "Update Device Node")

## Configuration

To find the device to update, the node requires the device ID. This field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a device based on the current workflow payload. The example below is doing exactly that, and is referencing the field `data.body.deviceId` on the workflow payload.

![Update Device Node Configuration](/images/workflows/data/update-device-node-config.png "Update Device Node Configuration")

There are three different ways to configure input data for the update device node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the device being updated, while the third choice is the more common option for simple situations.

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Device Patch](/rest-api/schemas/#device-patch) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Device Patch](/rest-api/schemas/#device-patch) schema.

![Update Device Node Individual Fields](/images/workflows/data/update-device-node-individual-fields.png "Update Device Node Individual Fields")

For "Individual Fields", the most common method to use and the one shown in the example above, the device is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). In this case, none of the fields are required - leaving a field blank will just not update that field on the device. In the example above, the node is just changing the description on the device and leaving the other fields alone.

![Update Device Node Attribute Configuration](/images/workflows/data/update-device-node-attr-config.png "Update Device Node Attribute Configuration")

The "Individual Field" configuration also allows you to modify the device attributes. You can add, remove, or replace attributes on the device while leaving other existing attributes intact. For removing attributes, the configuration just takes a [templatable](/workflows/accessing-payload-data/#string-templates) attribute name. In the example above, we are removing the attribute `tempF` from the device. If the attribute name to remove is not found on the device being updated, the removal does nothing. For replacing or adding an attribute, the configuration takes both the attribute name and the data type (which are both [templatable](/workflows/accessing-payload-data/#string-templates)). If the attribute name already exists on the device, the existing data type is modified, otherwise the new attribute name with the given data type is added to the existing device attributes. If more detailed control is needed for modifying attributes, the "JSON Template" or "Payload Path" methods of entry should be used.

![Update Device Node Tag Configuration](/images/workflows/data/update-device-node-tag-config.png "Update Device Node Tag Configuration")

Finally, the "Individual Field" configuration also allows you to modify tags. You can add, change, and remove tags on the device while leaving other existing tags intact. For removing tags, the configuration just takes a [templatable](/workflows/accessing-payload-data/#string-templates) tag key, and all tags that match the given key are removed. In the example above, we are removing the tag `reportsF` from the device. If the tag key to remove is not found on the device being updated, the removal does nothing. For modifying or adding a tag, the configuration takes both the key and the value (which are both [templatable](/workflows/accessing-payload-data/#string-templates)). If tags already exist on the device with the given key, they are removed, and a the new tag is added. If more detailed control is needed for modifying tags, the "JSON Template" or "Payload Path" methods of entry should be used.

![Update Device Node Result](/images/workflows/data/update-device-node-result.png "Update Device Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the updated device can be placed at that path on the current workflow payload. In the case of a successful device update operation, this will be the updated device object. In the case of a failed device update, this will be an object of the errors that occurred trying to update the device.

In addition, you have the option of changing the form of the tags on the device result. By default it is the standard array of key/value pairs (the same as the Losant API returns) - but you can instead ask for the tags to be in the form of an object map, where the tags property will be an object. In that case, each tag key will be a property on the object, and the value of that property will be an array of all the tag values for that key on the device. This is often an easier form to work with inside of workflows.

For instance, given the example node configuration in the screenshots above, this is a possible result for a successful device update:

```json
{
  "data": {
    "body": {
      "deviceId": "589de7d2a1975a00017b227f",
      "newDescription": "My example description",
      ...
    }
  },
  "deviceUpdateResult": {
    "name": "My Device",
    "description": "My example description",
    "attributes": [
      { "name": "tempC", "dataType": "number" }
    ],
    "tags": {
      "reportsC": ["true"]
    },
    "deviceClass": "standalone",
    "applicationId": "56c794a06895b00100cbe84c",
    "creationDate": "2017-04-06T19:28:37.284Z",
    "lastUpdated": "2017-06-15T16:56:36.348Z",
    "deviceId": "589de7d2a1975a00017b227f",
    "id": "589de7d2a1975a00017b227f",
    "connectionInfo": {
      "connected": null
    }
  },
  ...
}
```

And again, given the example above, this is a possible result for a failed update, in this case where the device was not found:

```json
{
{
  "data": {
    "body": {
      "deviceId": "589de7d2a1975a00017b227f",
      "newDescription": "My example description",
      ...
    },
    ...
  },
  "deviceUpdateResult": {
    "error": {
      "type": "NotFound",
      "message": "Device was not found"
    }
  },
  ...
}
```