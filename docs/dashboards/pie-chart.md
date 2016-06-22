# Pie Chart

The Pie Chart block displays proportional data across one or more devices. In the example below, a device's GPS data is being shown as a percentage of time it spends at certain locations.

![Pie Chart](/images/dashboards/pie-example.png "Pie Chart")

## Configuration

### Duration

To view the current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value.

![Gauge Duration](/images/dashboards/gauge-duration.png "Gauge Duration")

### Block Data

The block data is an array of segments, and each segment represents a region on the pie chart. While it is possible to create a chart within only one segment, the visualization would be meaningless as the segment has nothing against which to compare itself.

![Pie Block Data](/images/dashboards/pie-block-data.png "Pie Block Data")

Each segment takes four parameters:

* **Label** is the text displayed in the graph key for each segment. This can be any value, but you will want it to properly represent its segment.
* **Device IDS / Tags** is a [device query](/devices/device-queries) for choosing which devices are displayed within the segment.
* **Attribute** is the device attribute whose value will be displayed in the gauge. This attribute must be of the type `Number`. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Aggregation Type** only applies when Duration is set to anything other than "Last received data point", OR when a device tag is supplied in the device query, OR if more than one device ID is supplied within the device query. This determines how the all the available data returned should be aggregated before displaying the value. For example, choosing "MEAN" will average all data points together before displaying within the gauge.
