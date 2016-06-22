# GPS Heatmap

The GPS Heatmap shows the distribution of GPS datapoints across one or more devices. The heatmap can show historical information or the current position distribution for a set of devices.

![GPS Heatmap Dashboard](/images/dashboards/heatmap-example.png "GPS Heatmap Dashboard")

The map will automatically pan and zoom to display all the available data retrieved for the block's configuration. However, you are free to pan and zoom the map on your own.

## Configuration

At least one device ID or tag must be specified, along with a duration.

### Duration

![GPS Heatmap Duration](/images/dashboards/heatmap-duration.png "GPS Heatmap Duration")

To view the current location of your devices, select "Last received data point". This will show your devices on the map as red dots.

To view your devices' locations over a given period of time, choose any other value for duration. This will alter the map to show where your devices have been, as a percentage of time, over the given duration. The hotter the color (red and orange), the more time your device has spent in that location over the selected duration. Cooler colors (blue, purple) show places your device has been for some time in the given duration, but for a lesser percentage of time than the hotter areas.

### Block Data

![GPS Heatmap Device Query](/images/dashboards/heatmap-device-query.png "GPS Heatmap Device Query")

The physical location of one or multiple devices can be viewed on the GPS Heatmap. At least one device ID or device tag is required to create the map, and devices are chosen in the form of a [device query](/devices/device-queries).

![GPS Heatmap Attribute](/images/dashboards/heatmap-attribute.png "GPS Heatmap Attribute")

The selected device(s) must return an attribute of the type `GPS String`. In the **Attribute** dropdown, select the attribute's name to display on the graph. Note that, when displaying multiple devices on the heatmap, each device must return data under the same attribute name, and any device attributes that are not of the `GPS String` type will not be available to choose.
