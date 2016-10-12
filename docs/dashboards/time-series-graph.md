# Time Series Graph

The time series graph allows you to display historical data across one or more devices.

![Time Series Dashboard](/images/dashboards/time-series-dashboard.png "Time Series Dashboard")

## Configuration

Each time series graph provides the ability to view a single device or an aggregate over many devices from a single application.

![Time Series Settings](/images/dashboards/time-series-settings.png "Time Series Settings")

### Duration and Resolution

The duration and resolution fields allow you to configure how far into the past to view and how to group the data together. The available resolutions will change based on what you specify for the duration. For example, when you choose 30 days of data, the smallest resolution available is 60 minutes. This is because smaller resolutions result in more data points, and too much data can't be graphed by the browser and is hard to understand by the viewer.

The resolution and the aggregator specified in the block data section work together in order to generate a data point. For example, if the resolution is 60 minutes and the aggregator is `MEAN`, Losant will average all of the data together in 60- \minute increments to create a single point on the graph.

### Block Data

The time series graph is configured as individual series. Each series is displayed as a separate line on the graph. The example above is displaying the weather, dew point and humidity levels over the past 24 hours. Since each is configured as a separate series, each one displays as its own graph on the chart.

Each series can graph a single [device state](/devices/state) attribute. **The data type of the state attribute must be set to Number or Boolean to be properly visualized.**

The aggregator applied to the series defines how the data is combined based on the chosen resolution. The above example has the resolution set to 20 minutes. This means if weather data is being reported once every five minutes, each data point on the graph will be the average of four readings.

Each series can also aggregate the same attribute across multiple devices; therefore, **Device IDs / Tags** should be populated with a [device query](/devices/device-queries) to aggregate data for one or more devices per series.

![Time Series Settings](/images/dashboards/time-series-settings-tags.png "Time Series Settings")

When this is graphed, it is now a single series that contains the average of the temperatures reported by both devices.

Each series may be displayed as a line graph, a bar graph or an area chart, and each series also displays in a separate color. Line graphs and area charts also allow for configuring the weight of the line representing their data.

Hovering your mouse over the graph will display a tooltip, which shows the value of each series at that moment in time. Move your mouse left or right to view graph data back or forward in time respectively.

The minimum and/or maximum y-axis values may be manually set for each data series. If no values are set for the axis, the graph will default to a reasonable minimum and maximum for ALL series that are not given a custom axis. If a min and/or max is defined, and if at any point the graph extends beyond the defined minimum or maximum value, the graph will disappear off the edge of the block until the data returns to the defined window.

If you choose not to define a y-axis minimum or maximum value, the time series graph will automatically define a scale based on the data set it is currently rendering for the data series.

The Segment Label will be the label shown in the graph legend and in the tooltip. The y-axis label is used to name the y-axis for this series - if it is left blank, the name of the selected attribute is used.  Series that use the same y-axis labels share that axis on the resulting graph.
