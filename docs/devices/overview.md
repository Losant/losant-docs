# Devices

A device in Losant is a single thing or widget. A device could be car, thermostat, smart bulb, or any kind of custom gadget. Devices can contain many sensors or attached peripherals.

## Adding a Device

Devices can be added to your application on the `Devices` menu or using the `Add Device` button on your application's devices page.

![Add Device](/images/devices/add-device.png "Add Device")

When adding a device, you have a choice between creating a device from scratch, or creating a device based off of a [device recipe](/devices/device-recipes).  When creating a device from scratch, all device configuration fields will start off blank.  When creating a device from a recipe, the recipe is used as an initial template for the device, and so the new device will be initially filled in with the configuration from the recipe (which you can override however you would like before actually saving the new device).

![Device Creation Options](/images/devices/device-creation-options.png "Device Creation Options")

## Device Configuration

Properly configuring devices is an important step to ensuring proper communication between your device and the Losant platform.

### Device Type

![Device Type](/images/devices/device-type.png "Device Type")

The first thing to configure is the type of device.  This is not about the actual physical
type of the device, but more about how you expect the device to connect and report state
to the Losant platform.  There are 4 categories, but in most cases you will be choosing
the first, `Standalone`.

*   **Standalone**  
A standalone device is your normal everyday type of device.  It is allowed to connect
directly to Losant and report its own state.

*   **Gateway**  
A gateway device is a device that connects to Losant and reports both its own state and the
state of other devices - i.e., other devices that use this device as a "gateway".  Gateways
are extremely useful for helping to report the state of non-internet connected devices to Losant - such as Bluetooth sensors.

*   **Peripheral**  
A peripheral device does not connect directly to Losant - instead they report their
state to a gateway device, and that gateway pushes that state to Losant.  When choosing
peripheral as the device type, you must choose the particular gateway device that this
device will be reporting through, so that Losant knows what gateway has permission to report as this peripheral device.

### Device Tags

Device tags allow you to group and organize your devices. Tags are defined as keys and values and they can be set to anything you'd like. Tags can be used in many other areas of the Losant platform including choosing devices for visualizations, access keys, and workflow triggers. See the section on [device queries](/devices/device-queries) for targeting devices by tag within the platform.

![Device Tags](/images/devices/device-tags.png "Device Tags")

In the above example the `floor` tag is set to the value of `2` and the `color` tag is set to `red`. If you had many devices on different floors and of different colors, you could easily query all devices where `floor=2` or `color=red` to find the specific devices.

### Device Attributes

Your device's state attributes are one of the most important configuration options. These define what fields your device will report when it reports state.

![Device Attributes](/images/devices/device-attributes.png "Device Attributes")

The above example would work for a thermostat device. It has two attributes. One is named `inside-temp` and one is named `temp-setting`. This device would likely report the `inside-temp` every few minutes and only report `temp-setting` when the user has changed the setting.

Refer to the [device state](/devices/state) documentation for further details about state.

## Device Management

Once the device is added and successfully connected to Losant, there are several useful pieces of information available on the device page.

### Connection Status

The current connection status of your device is always available at the top of the device page.  For peripheral type devices, the connection status of the gateway device it is configured to use is displayed.

![Connection Status](/images/devices/connection-status.png "Connection Status")

For Standalone and Gateway type devices, you can also view a log of recent device connection events in the `Device Connection Log` section of the device page.

![Connection Log](/images/devices/connection-log.png "Connection Log")

Whenever a device is disconnected the log will contain the reason and the number of messages sent and received during the connected period. Typically messages sent correspond to state updates and message received correspond to commands.

### Debugging

Losant provides several tools on the device page to help debug communication between your device and the Losant platform.

#### Recent Device States

To debug whether or not your device is sending state to Losant, you can use the `Recent Device States` section of the device page.

![Recent Device States](/images/devices/state-log.png "Recent Device States")

This list will display the most recent 10 states published to Losant by this device. It displays the raw JSON data that represents a state request. This list will automatically update once a minute, but you can force a refresh at any time by clicking the `Refresh` button on the bottom right.

#### Force State

The `Force State in Losant` section of the device page allows you to report state on behalf of your device. This is useful if you're debugging workflows or other actions that are triggered based on device state.

![Force State](/images/devices/force-state.png "Force State")

#### Send Command

The `Send Device Command` section of the device page allows you to send commands to your devices. This is useful if your debugging and during initial implementation of command support for your devices.

![Send Command](/images/devices/send-command.png "Send Command")

#### Data Export

![Request Data Export](/images/devices/data-export.png "Request Data Export")

You can request a CSV export of the state data that Losant has for your device using the "Request Data Export" button.  This will generate a CSV file of the state data for your device and send you an email when the generation is complete. The email includes a link which will allow you to download the generated file (the link is time sensitive and will only work for 24 hours). The generated csv will have a timestamp column (where the timestamp will be represented as milliseconds since epoch), as well as columns for any attributes of your device. Each row will represent one reported state for the device.  The following is an example export for a device with a "location" and a "temperature" attribute:

```csv
time,location,temperature
1467391295000,"17.060258678655675,-18.965965126906564",25.2
1467391325000,"15.44856967605903,-17.68055596850872",25.1
1467391355000,"14.08786621979826,-16.618000514802763",25.2
1467391385000,"12.584784055193989,-15.465453903687301",25.3
1467391415000,"11.086833923977336,-14.336184577263243",25.3
```

#### Data Deletion

![Delete Device Data](/images/devices/data-deletion.png "Delete Device Data")

In the case where you no longer want the data for a device or you want to clear out old incorrect data, you can do so with the "Delete Device Data" button.  This will remove all data for the device - state data for attributes, connection log history, and command history. Data deletion may take a few seconds to propagate through the system, but cannot be reversed or undone, so do not press this button lightly!

## Exporting Devices

![Export Devices](/images/devices/devices-export.png "Export Devices")

To export a list of all the devices scoped to an application, visit the "All Devices" page and click the "Export All Devices" button in the top right corner of the list. This will retrieve all devices within the application and generate a CSV file for download. The CSV will include each device's name, ID, description, device type and each tag associated with the device.

Note that device exports always include the application's entire device list, not just the devices that are currently displayed in the interface (as filtered by name or paginated).
