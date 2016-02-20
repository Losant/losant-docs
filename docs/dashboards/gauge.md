# Gauge

The Gauge block displays a single attribute value, either as a number or as a visual representation in a dial.

![Gauge](/images/dashboards/gauge-example.png "Gauge")

## Configuration

### Block Type

Gauge blocks currently support two types. Additional types will be added in future releases.

![Gauge Type](/images/dashboards/gauge-block-type.png "Gauge Type")

* **Number Gauge** displays a value as a single number. Note that, though gauge is almost always used to display a number, it is possible to display an attribute of a different type. For example, you may choose to display an "ON" or "OFF" state here as reported by a device.
* **Dial Gauge** displays the value as a number, but also provides a gauge representation to show where that number stands against a minimum and maximum value provided by you. When "Dial Gauge" is selected, the "Min" and "Max" values are required, and each must be a number. Also, the attribute displayed in the gauge must be of the type `Number`.

### Duration

To view current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value.

![Gauge Duration](/images/dashboards/gauge-duration.png "Gauge Duration")

Note that, when choosing a value other than "Last received data point", it is necessary to choose an aggregation method in the block data.

### Block Data

![Gauge Block Data](/images/dashboards/gauge-block-data.png "Gauge Block Data")

The block data takes four arguments, three of which are required:

![GPS Heatmap Device Query](/images/dashboards/heatmap-device-query.png "GPS Heatmap Device Query")

The physical location of one or multiple devices can be viewed on the GPS Heatmap. At least one device ID or device tag is required to create the map, and devices are chosen in the form of a [device query](/devices/device-queries.md).

![GPS Heatmap Attribute](/images/dashboards/heatmap-attribute.png "GPS Heatmap Attribute")

The selected device(s) must return an attribute of the type `GPS (NMEA Format)`. In the **Attribute** input, enter the attribute's name to display on the graph. Note that, when displaying multiple devices on the heatmap, each device must return data under the same attribute name.
