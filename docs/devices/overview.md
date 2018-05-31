description: Learn more about configuring internet-connected devices in the Losant platform.

# Devices

A device in Losant is a single thing or widget. A device could be a car, thermostat, smart bulb, or any kind of custom gadget. Devices can contain many sensors or attached peripherals.

## Adding a Device

Devices can be added to your application on the `Devices` menu or using the `Add Device` button on your application's devices page.

![Add Device](/images/devices/add-device.png "Add Device")

When adding a device, you have a choice between creating a device from scratch, or creating a device based off of a [device recipe](/devices/device-recipes/). When creating a device from scratch, all device configuration fields will start off blank. When creating a device from a recipe, the recipe is used as an initial template for the device, and so the new device will be initially filled in with the configuration from the recipe (which you can override however you would like before actually saving the new device).

![Device Creation Options](/images/devices/device-creation-options.png "Device Creation Options")

## Device Configuration

Properly configuring devices is an important step to ensuring proper communication between your device and the Losant Platform.

### Device Type

![Device Type](/images/devices/device-type.png "Device Type")

The first thing to configure is the type of device. This is not about the actual physical type of the device, but more about how you expect the device to connect and report state to the Losant Platform. There are four categories ...

* **Standalone**  
  A Standalone device is your normal everyday type of device. It is allowed to connect directly to Losant and report its own state. In most cases, this is the device type you will choose.
* **Edge Compute**  
  An [Edge Compute device](/devices/edge-compute/) is a device that runs the Losant [Edge Agent](/edge-compute/edge-agent-usage/) and can run [edge workflows](/workflows/edge-workflows/) directly on the device itself. They also can behave as Gateway devices, in that they may report state on behalf of a Peripheral device.
* **Gateway**  
  A [Gateway](/devices/gateways-peripherals/) device is a device that connects to Losant and reports both its own state and the state of other devices - i.e., other devices that use this device as a "gateway". Gateways are extremely useful for helping to report the state of non-internet connected devices to Losant - such as Bluetooth sensors.
* **Peripheral**  
  A [Peripheral](/devices/gateways-peripherals/) device does not connect directly to Losant - instead it reports its state either to a Gateway or Edge Compute device (which is connected to the internet), and that gateway pushes the peripheral's state to Losant. When choosing peripheral as the device type, there are two options. You can either choose to let the device report state through any gateway in the application (which is useful for devices that move through the range of multiple gateways), or you can choose to only allow reporting through a specific gateway (useful for static or directly connected devices).

### Device Attributes

Your device's state attributes are one of the most important configuration options. These define what fields your device will report when it reports state.

![Device Attributes](/images/devices/device-attributes.png "Device Attributes")

The above example would work for a thermostat device. It has two attributes. One is named `inside-temp` and one is named `temp-setting`. This device would likely report the `inside-temp` every few minutes and only report `temp-setting` when the user has changed the setting.

Refer to the [device state](/devices/state/) documentation for further details about state.

### Device Tags

Device tags allow you to group and organize your devices. Tags are defined as keys and values and they can be set to anything you'd like. Tags can be used in many other areas of the Losant Platform including choosing devices for visualizations, access keys, and workflow triggers. See the section on [device queries](/devices/device-queries/) for targeting devices by tag within the platform. Tags are also a great place to store things like device configuration or threshold values, as the tag keys and values for a device are available to use within workflows (both in the cloud and on the edge) as well as in a number of the dashboard blocks.

![Device Tags](/images/devices/device-tags.png "Device Tags")

In the above example the `floor` tag is set to the value of `2` and the `color` tag is set to `red`. If you had many devices on different floors and of different colors, you could easily query all devices where `floor=2` or `color=red` to find the specific devices.

## Cloning an Existing Device

Once you've created a device you can clone it to create a copy with the same configuration. From the original device page, click "Clone Device" in the footer. This will create the new device and take you to its page where its configuration can be adjusted.

![Device Clone Button](/images/devices/device-clone-button.png "Device Clone Button")

If the original device has any unsaved changes, you'll be presented with the following modal so you can decide whether you want to apply the changes to the original device, the new device, or both devices:

![Device Clone Modal](/images/devices/device-clone-dirty-modal.png "Device Clone Modal")

**Note:** If you have a large number of devices that share similar configurations, it may be more convenient to [create a recipe](/devices/device-recipes/) for these devices.

## Device Management

Once the device is added and successfully connected to Losant, there are several useful pieces of information available on the device page.

### Connection Status

The current connection status of your device is always available beneath the device page's subnavigation. For peripheral type devices, the connection status of the gateway device it is configured to use is displayed.

![Connection Status](/images/devices/connection-status.png "Connection Status")

For Standalone and Gateway type devices, you can also view a log of recent device connection events in the `Device Connection Log` under the `Debug` section of the device page.

![Connection Log](/images/devices/connection-log.png "Connection Log")

Whenever a device is disconnected the log will contain the reason and the number of messages sent and received during the connected period. Typically messages sent correspond to [state updates](/devices/state/) and messages received correspond to [commands](/devices/commands/). The list will automatically update as new connection events come in.

### Debugging

Losant provides several tools on the device page to help debug communication between your device and the Losant Platform.

#### Recent Device States

To debug whether your device is sending state to Losant, you can use the `Recent Device States` log under the debug section of the device page.

![Recent Device States](/images/devices/state-log.png "Recent Device States")

This list will display the 25 most recent states published to Losant by this device. It displays the raw JSON data that represents a state request. This list will automatically update as new state requests come in.

#### Force State

The `Force State in Losant` form under the debug section of the device page allows you to report state on behalf of your device. This is useful if you're debugging workflows or other actions that are triggered based on device state.

![Force State](/images/devices/force-state.png "Force State")

#### Send Command

The `Send Device Command` form under the debug section of the device page allows you to send commands to your devices. This is useful if your debugging and during initial implementation of command support for your devices.

![Send Command](/images/devices/send-command.png "Send Command")

#### Data Export

![Request Data Export](/images/devices/data-export.png "Request Data Export")

You can request a CSV export of the state data that Losant has for your device using the "Request Data Export" form under the data section of the device page. This will generate a CSV file of the state data for your device and send you an email when the generation is complete. The email includes a link which will allow you to download the generated file (the link is time sensitive and will only work for 24 hours). The generated CSV will have a timestamp column (where the timestamp will be represented as milliseconds since epoch), an ISO Date column (where the time is represented in human readable form), as well as columns for any attributes of your device. Each row will represent one reported state for the device. The following is an example export for a device with a "location" and a "temperature" attribute:

```csv
Timestamp,ISO Date,location,temperature
1467391295000,"2016-07-01T16:41:35.000Z","17.060258678655,-18.965965126906",25.2
1467391325000,"2016-07-01T16:42:05.000Z","15.448569676059,-17.680555968508",25.1
1467391355000,"2016-07-01T16:42:35.000Z","14.087866219798,-16.618000514802",25.2
1467391385000,"2016-07-01T16:43:05.000Z","12.584784055193,-15.465453903687",25.3
1467391415000,"2016-07-01T16:43:35.000Z","11.086833923977,-14.336184577263",25.3
```

#### Data Deletion

![Delete Device Data](/images/devices/data-deletion.png "Delete Device Data")

In the case where you no longer want the data for a device or you want to clear out old incorrect data, you can do so with the "Delete Device Data" form under the data section of the device page. This will remove either all data for the device or data for a specific time range that you select - state data for attributes, connection log history, and command history. Data deletion may take a few seconds to propagate through the system, but cannot be reversed or undone, so do not press this button lightly!

## Device Communication Log

The device communication log is similar to the [application communication log](/applications/overview/#communication-log) in that is displays a real-time stream of events; it differs from the application log in that these events are specific to the device currently being viewed, instead of across the application as a whole. A number of different events will display within the log, such as:

* State reports for the device, whether they come via the device itself through the [Losant broker](/mqtt/overview/#the-losant-message-broker), via a [workflow](/workflows/overview/) or through the [Losant REST API](/rest-api/device/#send-state).
* [Commands](/devices/commands/) sent to the device, sent via any of the channels mentioned above.
* Device connection, disconnection and authentication events. For peripheral devices, the log will display these events for the peripheral's gateway.

Arbitrary topics the device publishes to or is subscribed to will not display within the device communication log.

## Exporting Devices

![Export Devices](/images/devices/devices-export.png "Export Devices")

To export a list of all the devices scoped to an application, visit the "All Devices" page and click the "Export All Devices" button in the top right corner of the list. This generate a CSV file of all devices in the application for download, which will be emailed to you after the export has completed. The CSV will include each device's name, ID, description, device type and each tag associated with the device.

Note that device exports always include the application's entire device list, not just the devices that are currently displayed in the interface (as filtered by name or paginated).
