# Device State Node

The device state node allows a workflow to update the state of a [device](/devices/overview/#device-configuration).

![Device State Node](/images/workflows/outputs/device-state-node.png "Device State Node")

## Configuration

There are two parts to configuring a device state node - selecting the device that the node should set the state of, and configuring what attributes and values should be set as the state. Users may manually choose a device, or they may define the [payload path](/workflows/accessing-payload-data/#payload-paths) of a device ID to use.

![Device State Node Configuration](/images/workflows/outputs/device-state-node-config.png "Device State Node Configuration")

There are three different ways to configure incoming state data for the device state node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you more control over the state being reported, while the third choice is the more common option for simple situations.

Any number of attributes can be configured - it does not have to be all of the attributes that the device is configured for. Values will be cast (if possible) to the type of attribute that the device has been previously defined to expect. If attributes are configured that are not valid for the given device, or if the values are not valid for the data type of that attribute, they will be ignored.

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object where each key is an attribute name and the corresponding value is the value for that attribute. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, is an object where each key is an attribute name and the corresponding value is the value for that attribute.

For "Individual Fields", the most common method to use and the one shown in the example above, the state payload is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). When a specific device is selected (as in the case above), the attribute names are pre-filled in. When the device that the node will send state for is not known, you can fill in the both attribute names as well as the values.

In the above example, the device state node is setting the state of the device `Electricity Cost`. It will set the `cents` attribute to the value of the field `pricing.price` in the current payload.

![Device State Node Time Configuration](/images/workflows/outputs/device-state-node-config-time.png "Device State Node Time Configuration")

In addition, optionally, the timestamp to associate with the state to report can be changed. By default, the timestamp of the current workflow payload being processed is used (the first radio option). But in cases where that timestamp value is not desired, there are two other options - the current time, or a timestamp on a specified payload path. The current time will often be very similar to the timestamp on the current workflow payload, but not always (depending on the length of time running the workflow takes) - and can in fact be drastically different in the case of non-realtime state reports triggering a workflow. When specifying a payload path, the workflow expects the timestamp to conform to the same rules as a timestamp on a [normal state report](/devices/state/#including-timestamps).
