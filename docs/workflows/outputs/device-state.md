flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant Device State Node.

# Device State Node

The Device State Node allows a workflow to update the state of a [device](/devices/overview/#device-configuration).

![Device State Node](/images/workflows/outputs/device-state-node.png "Device State Node")

## Configuration

There are two parts to configuring a Device State Node - selecting the device that the node should set the state of, and configuring what attributes and values should be set as the state. Users may manually choose a device, or they may define the [payload path](/workflows/accessing-payload-data/#payload-paths) of a device ID to use.

![Device State Node Configuration](/images/workflows/outputs/device-state-node-config.png "Device State Node Configuration")

There are three different ways to configure incoming state data for the Device State Node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you more control over the state being reported, while the third choice is the more common option for simple situations.

Any number of attributes can be configured - it does not have to be all of the attributes that the device is configured for. Values will be cast (if possible) to the type of attribute that the device has been previously defined to expect. If attributes are configured that are not valid for the given device, or if the values are not valid for the data type of that attribute, they will be ignored.

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object where each key is an attribute name and the corresponding value is the value for that attribute. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, is an object where each key is an attribute name and the corresponding value is the value for that attribute.

For "Individual Fields", the most common method to use and the one shown in the example above, the state payload is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). When a specific device is selected (as in the case above), the attribute names are pre-filled in. When the device that the node will send state for is not known, you can fill in the both attribute names as well as the values.

In the above example, the Device State Node is setting the state of the device `Electricity Cost`. It will set the `cents` attribute to the value of the field `pricing.price` in the current payload.

![Device State Node Time Configuration](/images/workflows/outputs/device-state-node-config-time.png "Device State Node Time Configuration")

In addition, optionally, the timestamp to associate with the state to report can be changed. By default, the timestamp of the current workflow payload being processed is used (the first radio option). But in cases where that timestamp value is not desired, there are two other options - the current time, or a timestamp on a specified payload path. The current time will often be very similar to the timestamp on the current workflow payload, but not always (depending on the length of time running the workflow takes) - and can in fact be drastically different in the case of non-realtime state reports triggering a workflow. When specifying a payload path, the workflow expects the timestamp to conform to the same rules as a timestamp on a [normal state report](/devices/state/#including-timestamps).

## Cloud vs Edge Behavior

If the workflow is a [cloud](/workflows/cloud-workflow) workflow, the Device State Node can update the state for any device. However, if the workflow is an [edge](/workflows/edge-workflow), the permissions of the workflow are constrained by the [edge compute](/devices/edge-compute/) device the workflow is running on. In that case, the rules about reporting state for [gateways and peripherals](/devices/gateways-peripherals/#reporting-state-for-peripheral) apply - the workflow can report state for the device it is running on, as well as any peripherals that it has permission to talk on behalf of.

## Offline Edge Support

[Edge compute](/devices/edge-compute/) devices are not required to be connected to the internet (or Losant) at all times, and the Device State Node respects that. If the device is not connected to the internet when the node executes, the state report is timestamped with the current time (according to the clock of the edge device) and will be sent to Losant when the edge device next connects to the internet.

## Advanced Configuration

When in `JSON template` or `payload path` mode, the Device State Node accepts a number of different formats for the state data:

* An object of attribute name/value pairs (essentially the same as how the `Individual Fields` mode works), like the following:

```json
{
  "attr1": "value1",
  "attr2": "value2",
  ...
}
```

* A complete state object, of the same form that Losant accepts over [MQTT](/mqtt/overview/#publishing-device-state) or [REST](/rest-api/device/#send-state). In this form, you can provide your own timestamp directly, instead of using the timestamp the node would provide. In this case, the object looks like the following:

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "attr1": "value1",
    "attr2": "value2",
    ...
  }
}
```

* An array of objects of attribute name/value pairs. When using this mode, take care to remember that every object in the array will be reported with the same timestamp (the timestamp the node provides). So if you set a value for the same attribute in two different objects in the array, the second one will be the one that is actually applied. In this case, the object looks like the following:

```json
[
  {
    "attr1": "value1",
    "attr2": "value2",
    ...
  },
  {
    "attr3": "value3",
    "attr4": "value4",
    ...
  },
  ...
]
```

* An array of complete state objects, of the same form that Losant accepts over [MQTT](/mqtt/overview/#publishing-device-state) or [REST](/rest-api/device/#send-state). Using this form, you can send multiple state reports with different timestamps at once. In this case, the object looks like the following:

```json
[
  {
    "time": "2016-06-13T04:00:00.000Z",
    "data": {
      "attr1": "value1a",
      "attr2": "value2a",
      ...
    }
  },
  {
    "time": "2016-06-13T05:00:00.000Z",
    "data": {
      "attr1": "value1b",
      "attr2": "value2b",
      ...
    }
  },
  ...
]
```

## Throttling And Limits

The Device State Node has the same throttling rules as using the [API](/rest-api/overview/#throttles-and-limits) or the [broker](/organizations/resource-limits/#message-throttling) to set state - it is limited to 30 calls in a 15-second window (per device) - on average, 2 calls per second.
