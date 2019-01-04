---
description: Learn about adding and configuring a Pie Chart on a Losant Dashboard.
---

# Pie Chart

The Pie Chart block displays proportional data across one or more devices. In the example below, a device's [GPS data](/devices/state/#gps-attributes) is being shown as a percentage of time it spends at certain locations.

![Pie Chart](/images/dashboards/pie-example.png "Pie Chart")

## Configuration

### Data Type

![Data Type](/images/dashboards/gauge-data-type.png "Data Type")

The Pie Chart can display points as a **live stream** (re-rendering the chart every time a data point hits the platform) or as an **historical** chart. Each style has its own advantages:

* **Live stream** charts provide feedback with more immediacy than historical charts, as they do not require a dashboard data refresh to populate with new data. If one of the block's segments references multiple devices by ID or tag, the block will update anytime any of those devices reports state for the chosen attribute. For this reason we recommend one device per segment when building live stream blocks.
* **Historical** charts allow for data to be aggregated according to a number of rules (based on time durations, mathematical functions and the combination of data from multiple sources), and they also allow for [viewing past dashboard states](/dashboards/overview/#viewing-past-dashboard-states).

### Duration

To view the current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value. This option is removed when "Live Stream" is selected for the block's data type.

![Gauge Duration](/images/dashboards/gauge-duration.png "Gauge Duration")

### Block Data

The block data is an array of segments, and each segment represents a region on the pie chart. While it is possible to create a chart within only one segment, the visualization would be meaningless as the segment has nothing against which to compare itself.

![Pie Block Data](/images/dashboards/pie-block-data.png "Pie Block Data")

Each segment takes four parameters:

* **Label** is the text displayed in the graph key for each segment. This can be any value, but you will want it to properly represent its segment.
* **Device IDS / Tags** is a [device query](/devices/device-queries/) for choosing which devices are displayed within the segment.
* **Attribute** is the device attribute whose value will be displayed in the gauge. This attribute must be of the type `Number`. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Aggregation Type** only applies when Duration is set to anything other than "Last received data point", OR when a device tag is supplied in the device query, OR if more than one device ID is supplied within the device query. This determines how the all the available data returned should be aggregated before displaying the value. For example, choosing "Mean" will average all data points together before displaying within the gauge.
