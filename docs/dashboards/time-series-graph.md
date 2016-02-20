# Time Series Graph

The time series graph allows you to display historical data across one or more devices.

![Time Series Dashboard](/images/dashboards/time-series-dashboard.png "Time Series Dashboard")

## Configuration

Each time series graph provides the ability to view a single device or an aggregate over many devices from a single application.

![Time Series Settings](/images/dashboards/time-series-settings.png "Time Series Settings")

### Duration and Resolution

The duration and resolution fields allow you to configure how far into the past to view and how to group the data together. The available resolutions will change based on what you specify for the duration. For example, when you choose 30 days of data, the smallest resolution available is 60 minutes. This is because smaller resolutions result in more data points, and too much data can't be graphed by the browser and is hard to understand by the viewer.

The resolution and the aggregator specified in the block data section work together in order to generate a data point. For example, if the resolution is 60 minutes and the aggregator is mean, Structure will average all of the data together in 60 minute increments to create a single point on the graph.

### Block Data

The time series graph is configured as individual series. Each series is displayed as a separate line on the graph. The example above is displaying the temperature of two different devices. Since they are specified as two different series, the graph is representing them as two different lines.

Each series can graph a single [device state](/devices/state.md) attribute. **The data type of the state attribute must be set to Number to be properly visualized.**

The aggregator applied to the series defines how the data is combined based on the chosen resolution. The above example has the resolution set to 10 seconds. This means if your devices are reporting temperature once per second, each data point on the graph will be the average of 10 temperature readings.

Each series can also aggregate the same attribute across multiple devices; therefore, **Device IDs / Tags** should be populated with a [device query](/devices/device-queries.md) to aggregate data for one or more devices per series.

![Time Series Settings Device Aggregate](/images/dashboards/time-series-combined.png "Time Series Settings Device Aggregate")

When this is graphed, it is now a single series that contains the average temperature of both devices.
