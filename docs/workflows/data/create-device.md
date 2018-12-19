---
flowclass:
  - Application
  - Experience
description: 'Learn more about the Losant Device: Create Node.'
---

# Device: Create Node

The Create Device Node allows a workflow to create a new [Device](/devices/overview/) inside the current application, and optionally add the new device to the current workflow payload.

![Create Device Node](/images/workflows/data/create-device-node.png "Create Device Node")

## Configuration

There are three different ways to configure input data for the Create Device Node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the device being created, while the third choice is the more common option for simple situations.

In all three cases, though, you can start by choosing a [Device Recipe](/devices/device-recipes/), which will be used as the defaults for creating the device. Any further configuration of the device (through any of the three methods) will override the defaults provided by the recipe selection.

![Create Device Node Configuration](/images/workflows/data/create-device-node-config.png "Create Device Node Configuration")

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Device Post](/rest-api/schemas/#device-post) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Device Post](/rest-api/schemas/#device-post) schema.

For "Individual Fields", the most common method to use and the one shown in the example above, the device is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). In this case, name is required, and the other fields are optional (same as when creating a [Device](/devices/overview/) normally).

![Create Device Node More Configuration](/images/workflows/data/create-device-node-more-config.png "Create Device Node More Configuration")

The "Individual Field" configuration continues down into allowing you specify attributes for the new device. Both the attribute name and data type are templatable (although they must resolve to valid names and data types).

Finally, the "Individual Field" configuration also allows you to set tags, following the same rules as when creating a [Device](/devices/overview/) normally. In the example above, one tag will be added to this new device - a tag with the key `externalId` and the value brought in as a [string templates](/workflows/accessing-payload-data/#string-templates) (both the keys and values here are templatable).

![Create Device Node Result](/images/workflows/data/create-device-node-result.png "Create Device Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the created device can be placed at that path on the current workflow payload. In the case of a successful device creation, this will be the device object, and in the case of a failed device creation this will be an object of any errors about the creation of the device.

In addition, you have the option of changing the form of the tags on the device result. By default it is the standard array of key/value pairs (the same as the Losant API returns) - but you can instead ask for the tags to be in the form of an object map, where the tags property will be an object. In that case, each tag key will be a property on the object, and the value of that property will be an array of all the tag values for that key on the device. This is often an easier form to work with inside of workflows.

For instance, given the example node configuration in the screenshots above, this is a possible result for a successful device creation:

```json
{
  "data": {
    "body": {
      "externalId": "myExternalSystemId",
      "name": "myDevice"
      ...
    },
    "deviceResult": {
      "name": "myDevice",
      "tags": { "externalId": ["myExternalSystemId"] },
      "attributes": [
        { "name": "sensor",
        "dataType": "number" }
      ],
      "applicationId": "589de7d2a1975a00017b227f",
      "creationDate": "2017-06-14T20:30:34.637Z",
      "lastUpdated": "2017-06-14T20:30:34.647Z",
      "deviceClass": "standalone",
      "deviceId": "59419cea5efece00078a1a69",
      "id": "59419cea5efece00078a1a69",
      "connectionInfo": {
        "connected": null
      }
    }
    ...
  },
  ...
}
```

And again, given the example above, this is a possible result for a failed creation with a blank name:

```json
{
  "data": {
    "body": {
      "systemId": "myExternalSystemId",
      "name": "",
      ...
    },
    "deviceResult": {
      "error": {
        "type": "Validation",
        "message": "name is required"
      }
    },
    ...
  },
  ...
}
```
