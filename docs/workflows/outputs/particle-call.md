flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Particle Device Function Call Node.

# Particle Device Function Call

The Particle Call Node allows a workflow to call a remote function on a device through a [Particle integration](/applications/integrations/#particle).

![Particle Call Node](/images/workflows/outputs/particle-call-node.png "Particle Call Node")

## Configuration

Configuration for the node is broken up into three sections.

### Integration & Configuration

The **Integration** is the [Particle integration](/applications/integrations/#particle) you created prior to configuring this node.

The **Function Name** is the name of the remote function to call. This is templatable.

The **Device Name or ID** is where you can specify the particular device that will receive the function call. If the selected Particle integration is configured for a single device, this field is optional - otherwise it is required. This field is also templatable.

The **Product Name or Slug** is where you can specify the Product that this device belongs to inside of Particle. This field is optional, and templatable.

### Function Argument

You may optionally include a string argument for the function call. There are two methods by which you an add an argument:

* **String Template** accepts standard template, which will be rendered as a string.
* **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) to the value to use as the argument. If the value is an object, it is stringified as JSON.

### Result Path

Optionally, you can store the function response on the current payload by entering a [payload path](/workflows/accessing-payload-data/#payload-paths) here.

The returned value of the function call, for a successful call, will take the following form (which corresponds to the return value of the [Particle callFunction](https://docs.particle.io/reference/javascript/#callfunction) call):

```json
{
  "id": "the_particle_device_id",
  "last_app": "",
  "connected": true,
  "return_value": <the function return value>
}
```

In the case of a failed function call, it will take the following form instead:

```json
{
  "error": {
    "message": "A message about the error that occurred"
  }
}
```
