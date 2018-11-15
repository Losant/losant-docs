flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Device Command Node.

# Device Command Node

The Device Command Node allows a workflow to send a [command](/devices/commands/) to one or more devices.

![Device Command Node](/images/workflows/outputs/device-command-node.png "Device Command Node")

## Configuration

There are three parts to configuring a Device Command Node - selecting the devices to send the command to, configuring the command name, and optionally creating a payload to be sent with the command.

![Device Command Node Selection](/images/workflows/outputs/device-command-node-devices.png "Device Command Node Selection")

First step is selecting the devices to send the command to. The node has two options for selecting devices - you can specifically select a set of devices, or you can pull one or more device IDs off of the current workflow payload using a [payload path templates](/workflows/accessing-payload-data/#payload-paths). That second option allows a workflow to dynamically change what specific devices are being sent a command depending on the payload currently being processed. In the example above, the first option is being used, and the node will send the command all devices whose tag `deviceType` is equal to `colorBulb`.

![Device Command Node Configuration](/images/workflows/outputs/device-command-node-config.png "Device Command Node Configuration")

The command name field supports [string templates](/workflows/accessing-payload-data/#string-templates), so if the command needs to be dynamically determined, it is possible to alter the command based on the current payload. The command payload is optional, and depending on the needs of the command being sent, may or may not be needed. If the command payload is needed, it must be entered as a [JSON template](/workflows/accessing-payload-data/#json-templates).

In the above example, the Device Command Node is sending the command `setHueColor` with a payload. And given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393
  },
  ...
}
```

The Device Command Node would send the following command payload with the `setHueColor` command:

```json
{
  "hue": 1393
}
```

## Throttling And Limits

The Device Command Node has the same throttling rules as using the [API](/rest-api/overview/#throttles-and-limits) or the [broker](/organizations/resource-limits/#message-throttling) to send commands - it is limited to 30 calls in a 15-second window (per device) - on average, 2 calls per second.