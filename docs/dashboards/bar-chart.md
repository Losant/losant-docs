---
description: Learn about adding and configuring a Bar Chart on a Losant Dashboard.
---

# Bar Chart

The Bar Chart allows you to display proportional data across one or more devices.

![Bar Chart Dashboard](/images/dashboards/bar-chart-example.png "Bar Chart Dashboard")

## Configuration

### Data Type

![Data Type](/images/dashboards/gauge-data-type.png "Data Type")

The Bar Chart can display points as a **live stream** (re-rendering the chart every time a data point hits the platform) or as an **historical** chart. Each style has its own advantages:

* **Live stream** charts provide feedback with more immediacy than historical charts, as they do not require a dashboard data refresh to populate with new data. If one of the block's segments references multiple devices by ID or tag, the block will update anytime any of those devices reports state for the chosen attribute. For this reason we recommend one device per segment when building live stream blocks.
* **Historical** charts allow for data to be aggregated according to a number of rules (based on time durations, mathematical functions and the combination of data from multiple sources), and they also allow for [viewing past dashboard states](/dashboards/overview/#viewing-past-dashboard-states).

### Duration

To view the current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value. This option is removed when "Live Stream" is selected for the block's data type.

![Bar Chart Duration](/images/dashboards/bar-chart-duration.png "Bar Chart Duration")

### Block Data

Each bar in the Bar Chart represents one data set. In the example above, each bar represents the number of remaining pours in a keg.

Each series can graph a single [device state](/devices/state/) attribute. **The data type of the state attribute must be set to Number to be properly visualized.**

![Bar Chart Data Set](/images/dashboards/bar-chart-data-set.png "Bar Chart Data Set")

Each series can also aggregate the same attribute across multiple devices; therefore, **Device IDs / Tags** should be populated with a [device query](/devices/device-queries/) to aggregate data for one or more devices per series.

In the event that a duration other than "Last received data point" is chosen, OR if more than one device is selected for a data set (either by manually choosing multiple devices or by specifying a device tag), an aggregation method must be defined for your data set. This determines how the data should be represented on the graph when multiple data points are present.

![Bar Chart Aggregation](/images/dashboards/bar-chart-aggregation.png "Bar Chart Aggregation")

When this is graphed, it is now a single bar that contains the sum of all pours across the different devices.
