# Device State Trigger

The device state trigger will trigger a workflow whenever one or more devices report state.

![Device Triggers](/images/workflows/triggers/device-triggers.png "Device Triggers")

## Configuration

There are two device trigger nodes. One that accepts a single device ID and one that accepts a device tag. The rest of the workflow will work exactly the same regardless of which device trigger is used.

### Single Device Trigger

The single device trigger node accepts a single device ID and will trigger the workflow whenever that specific device reports state.

![Device Trigger Config](/images/workflows/triggers/device-trigger-config.png "Device Trigger Config")

### Device Tag Trigger

The device tag trigger allows you to create a trigger that will be invoked whenever any device that contains a specific tag reports state.

![Device Tag Trigger Config](/images/workflows/triggers/device-tag-trigger-config.png "Device Tag Trigger Config")

In the above example, the workflow will be triggered whenever any device with the `floor` tag set to `2` reports state.

## Payload

The payload will include the device's state on the `data` field. The payload will only include the attributes currently reported by the device. So for example, if the device has four attributes configured, but only reports state containing one, this payload will only include the one attribute.

```json
{
  "data" : {
    "attribute-name" : value,
    "attribute-name" : value,
    ...
  }
}
```
