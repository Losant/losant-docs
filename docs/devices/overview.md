# Devices

A device in Structure is a single thing or widget. A device could be car, thermostat, smart bulb, or any kind of custom gadget. Devices can contain many sensors or attached peripherals.

## Adding a Device

Devices can be added to your application on the `Devices` menu or using the `Add Device` button on your application's devices page.

![Add Device](/images/devices/add-device.png "Add Device")

When adding a device, you have a choice between creating a device from scratch, or creating a device based off of a [device recipe](/devices/device-recipes).  When creating a device from scratch, all device configuration fields will start off blank.  When creating a device from a recipe, the recipe is used as an initial template for the device, and so the new device will be initially filled in with the configuration from the recipe (which you can override however you would like before actually saving the new device).

![Device Creation Options](/images/devices/device-creation-options.png "Device Creation Options")

## Device Configuration

Properly configuring devices is an important step to ensuring proper communication between your device and the Structure platform.

### Virtual Device

![Virtual Device](/images/devices/virtual-device.png "Virtual Device")

A virtual device acts just like a physical device in most cases. The major difference is how state is reported. A virtual device's state can only be reported using a Structure workflow. Virtual devices are useful if you'd like to record sensor data from something other than a physical thing. For example, you could create a workflow that requests the outside temperature every few minutes from a 3rd party weather API and saves the result as the state of a virtual device. Since this information is now on a device, you can visualize, trigger workflows, or perform any other actions on this information as if the data came from an actual physical widget.

### Device Tags

Device tags allow you to group and organize your devices. Tags are defined as keys and values and they can be set to anything you'd like. Tags can be used in many other areas of the Structure platform including choosing devices for visualizations, access keys, and workflow triggers. See the section on [device queries](/devices/device-queries) for targeting devices by tag within the platform.

![Device Tags](/images/devices/device-tags.png "Device Tags")

In the above example the `floor` tag is set to the value of `2` and the `color` tag is set to `red`. If you had many devices on different floors and of different colors, you could easily query all devices where `floor=2` or `color=red` to find the specific devices.

### Device Attributes

Your device's state attributes are one of the most important configuration options. These define what fields your device will report when it reports state.

![Device Attributes](/images/devices/device-attributes.png "Device Attributes")

The above example would work for a thermostat device. It has two attributes. One is named `inside-temp` and one is named `temp-setting`. This device would likely report the `inside-temp` every few minutes and only report `temp-setting` when the user has changed the setting.

Refer the [device state](#) documentation for further details about state.

## Device Management

Once the device is added and successfully connected to Structure, there are several useful pieces of information available on the device page.

### Connection Status

The current connection status of your device is always available at the top of the device page.

![Connection Status](/images/devices/connection-status.png "Connection Status")

You can also view a log off recent device connection events in the `Device Connection Log` section of the device page.

![Connection Log](/images/devices/connection-log.png "Connection Log")

Whenever a device is disconnected the log will contain the reason and the number of messages sent and received during the connected period. Typically messages sent correspond to state updates and message received correspond to commands.

### Debugging

Structure provides several tools on the device page to help debug communication between your device and the Structure platform.

#### Recent Device States

To debug whether or not your device is sending state to Structure, you can use the `Recent Device States` section of the device page.

![Recent Device States](/images/devices/state-log.png "Recent Device States")

This list will display the most recent 10 states published to Structure by this device. It displays the raw JSON data that represents a state request. This list will automatically update once a minute, but you can force a refresh at any time by clicking the `Refresh` button on the bottom right.

#### Force State

The `Force State in Structure` section of the device page allows you to report state on behalf of your device. This is useful if you're debugging workflows or other actions that are triggered based on device state.

![Force State](/images/devices/force-state.png "Force State")

#### Send Command

The `Send Device Command` section of the device page allows you to send commands to your devices. This is useful if your debugging and during initial implementation of command support for your devices.

![Send Command](/images/devices/send-command.png "Send Command")
