# Device List

The Device List Block displays a list of devices for a given application. The list includes the device's name, current connection status and number of defined attributes.

![Device List](/images/dashboards/devices-example.png "Device List")

## Configuration

The block takes two parameters ...

### Device Filter

![Device List Filter](/images/dashboards/devices-filter.png "Device List Filter")

You may optionally provide a filter to reduce the list of devices by name(s), tag(s) or a search parameter. For the search parameter, the filter accepts an asterisk `*` to search for any occurrence of the given characters in the device name. For example:

* Filtering with "dev" will display a device called "Device A" but hide one called "Second Device"
* Filtering with "\*dev", will show both the "Device A" and "Second Device" devices

To display all of your devices for a given application, do not provide a filter.

### Device Link

![Device List Link](/images/dashboards/devices-link.png "Device List Link")

By default, device names link to their respective configuration pages. (For [public users](/dashboards/overview/#dashboard-access-control) and users who do not have [permission to edit](/organizations/members/#member-roles) the devices' application, no link is provided.)

You may override this behavior and link to a URL of your choosing. The custom URL supports [Handlebars helpers](/workflows/accessing-payload-data/#string-templates), and information about the device (such as the name, ID and tags) is available within the template. For example, one could configure a device list block to behave as a table of contents for a dashboard built with [context variables](/dashboards/context-variables/) by linking to different contexts per device.

If a custom URL is provided, the link will always display, regardless of the user's permission level or public status.
