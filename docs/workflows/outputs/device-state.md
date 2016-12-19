# Device State Node

The device state node allows a workflow to update the state of a [device](/devices/overview/#device-configuration).

![Device State Node](/images/workflows/outputs/device-state-node.png "Device State Node")

## Configuration

There are two parts to configuring a device state node - selecting the device that the node should set the state of, and configuring what attributes and values should be set as the state. Users may manually choose a device, or they may define the [payload path](/workflows/accessing-payload-data/#payload-paths) of a device ID to use.

![Device State Node Configuration](/images/workflows/outputs/device-state-node-config.png "Device State Node Configuration")

Any number of attributes can be configured - it does not have to be all of the attributes that the device is configured for.  Attribute values [string templates](/workflows/accessing-payload-data/#string-templates), so they can pull values off of the currently executing workflow payload.  Values will be cast (if possible) to the type of attribute that the device has been previously defined to expect.

In the above example, the device state node is setting the state of the device `Electricity Cost`.  It will set the `cents` attribute to the value of the field `data.pricing.price` in the current payload.

![Device State Node Time Configuration](/images/workflows/outputs/device-state-node-config-time.png "Device State Node Time Configuration")

In addition, optionally, the timestamp to associate with the state to report can be changed. By default, the timestamp of the current workflow payload being processed is used (the first radio option). But in cases where that timestamp value is not desired, there are two other options - the current time, or a timestamp on a specified payload path. The current time will often be very similar to the timestamp on the current workflow payload, but not always (depending on the length of time running the workflow takes) - and can in fact be drastically different in the case of non-realtime state reports triggering a workflow. When specifying a payload path, the workflow expects the timestamp to conform to the same rules as a timestamp on a [normal state report](/devices/state/#including-timestamps).
