# Virtual Device Node

The virtual device node allows a workflow to update the state of a [virtual device](/devices/overview/#device-configuration).

![Virtual Device Node](/images/workflows/outputs/virtual-device-node.png "Virtual Device Node")

## Configuration

There are two parts to configuring a virtual device node - selecting the virtual device that the node should set the state of, and configuring what attributes and values should be set as the state.

![Virtual Device Node Configuration](/images/workflows/outputs/virtual-device-node-config.png "Virtual Device Node Configuration")

Any device marked as "Virtual Device" is a valid device to select as the device for this node.  If the device selected is not a "Virtual Device", the node will perform no operation.

Any number of attributes can be configured - it does not have to be all of the attributes that the virtual device is configured for.  However, any attributes names that are not configured on the selected virtual device will be ignored when the node runs.  Attribute values support templating, and so can pull values off of the currently executing workflow payload.  Values will be cast (if possible) to the type of attribute that the device has been previously defined to expect.

In the above example, the virtual device node is setting the state of the device `Electricity Cost`.  It will set the `cents` field to the value of the field `data.pricing.price` in the current payload.
