# Device Command Node

The device command node allows a workflow to send a [command](/devices/commands/) to one or more devices.

![Device Command Node](/images/workflows/outputs/device-command-node.png "Device Command Node")

## Configuration

There are three parts to configuring a device command node - selecting the devices to send the command to, configuring the command name, and optionally creating a payload to be sent with the command.

![Device Command Node Configuration](/images/workflows/outputs/device-command-node-config.png "Device Command Node Configuration")

The devices to send a command to can be selected individually or using tags, using the standard Losant device selection dropdown - see the [device query](/devices/device-queries/) documentation for more information.  The command name field supports payload templates, so if the command needs to be dynamically determined, it is possible to alter the command based on the current payload.  The command payload is optional, and depending on the needs of the command being sent, may or may not be needed.  If the command payload is needed, it must evaluate to a valid JSON object.  The command payload field also supports templating - so complex JSON objects can be dynamically constructed out of the current workflow payload.

In the above example, the device command node is sending the command `setHueColor` to all devices whose `deviceType` tag has the value `colorBulb`.  And given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "voltage": 1.7,
    "color": 1393
  },
  "applicationId": "56311a8e51645b2054eb258b",
  "triggerId": "56c74add04d0b50100043381",
  "triggerType": "deviceId",
  "flowId": "5661f1330ae2980100894f45"
}
```

The device command node would send the following command payload with the `setHueColor` command:

```JSON
{
  "hue": 1393
}
```
