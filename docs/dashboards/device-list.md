# Device List

The Device List block displays a list of devices for a given application. The list includes the device's name, current connection status and number of defined attributes.

![Device List](/images/dashboards/devices-example.png "Device List")

## Configuration

The block takes one optional parameter: a filter to reduce the list of devices by name. The filter accepts an asterisk `*` to search for any occurrence of the given characters in the device name. For example:

* Filtering with "dev" will display a device called "Device A" but hide one called "Second Device"
* Filtering with "\*dev", will show both the "Device A" and "Second Device" devices

To display all of your devices for a given application, do not provide a filter.

![Device List Config](/images/dashboards/devices-filter.png "Device List Config")
