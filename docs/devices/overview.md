# Devices

A device in Structure is a single thing or widget. A device could be car, thermostat, smart bulb, or any kind of custom gadget. Devices can contain many sensors or attached peripherals.

## Adding a Device

Devices can be added to your application on the `Devices` menu or using the `Add Device` button on your application's devices page.

![Add Device](/images/devices/add-device.png "Add Device")

## Device Configuration

Properly configuring devices is an important step to ensuring proper communication between your device and the Structure platform.

### Virtual Device

![Virtual Device](/images/devices/virtual-device.png "Virtual Device")

A virtual device acts just like a physical device in most cases. The major difference is how state is reported. A virtual device's state can only be reported using a Structure workflow. Virtual devices are useful if you'd like to record sensor data from something other than a physical thing. For example, you could create a workflow that requests the outside temperature every few minutes from a 3rd party weather API and saves the result as the state of a virtual device. Since this information is now on a device, you can visualize, trigger workflows, or perform any other actions on this information as if the data came from an actual physical widget.

### Device Tags

Device tags allow you to group and organize your devices. Tags are defined as keys and values and they can be set to anything you'd like. Tags can be used in many other areas of the Structure platform including choosing devices for visualizations, access keys, and workflow triggers.

![Device Tags](/images/devices/device-tags.png "Device Tags")

In the above example the `floor` tag is set to the value of `2` and the `color` tag is set to `red`. If you had many devices on different floors and of different colors, you could easily query all devices where `floor=2` and `color=red` to find the specific devices.

### Device Attributes

Your device's state attributes are one of the most important configuration options. These define what fields your device will report when it reports state.

![Device Attributes](/images/devices/device-attributes.png "Device Attributes")

The above example would work for a thermostat device. It has two attributes. One is named `inside-temp` and one is named `temp-setting`. This device would likely report the `inside-temp` every few minutes and only report `temp-setting` when the user has changed the setting.

Refer the [device state](#) documentation for further details about state.

## Device Management

Once the device is added and successfully connected to Structure, there are several useful pieces of information available on the device page.
