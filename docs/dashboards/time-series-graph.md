# Time Series Graph

The time series graph allows you to display historical data across one or more devices.

![Time Series Dashboard](/images/dashboards/time-series-dashboard.png "Time Series Dashboard")

## Configuration

Each time series graph provides the ability to view a single device or an aggregate over many devices from a single application.

![Time Series Settings](/images/dashboards/time-series-settings.png "Time Series Settings")

### Duration and Resolution

The duration and resolution fields allow you to configure how far into the past to view and how to group the data together. The available resolutions will change based on what you specify for the duration. For example, when you choose 30 days of data, the smallest resolution available is 60 minutes. This is because smaller resolutions result in more data points, and too much data can't be graphed by the browser and is hard to understand by the viewer.

The resolution and the aggregator specified in the block data section work together in order to generate a data point. For example, if the resolution is 60 minutes and the aggregator is mean, Losant will average all of the data together in 60 minute increments to create a single point on the graph.

### Line Display Type

![Line Display Type](/images/dashboards/time-series-type.png "Line Display Type")

Time series graphs can either be displayed as a connected line graph (the "Line" option), where each point in a series is connected to the next point, or as a unconnected chart (the "Stick" option) where each point in the series is individual and represented as a stick rising from the x-axis.  In most cases, Line is the option that makes the most sense, but in cases where data points are disjointed or rare, the Stick display option can make for a more understandable display of the underlying data.

### Block Data

The time series graph is configured as individual series. Each series is displayed as a separate line on the graph. The example above is displaying the temperature of two different devices. Since they are specified as two different series, the graph is representing them as two different lines.

Each series can graph a single [device state](/devices/state) attribute. **The data type of the state attribute must be set to Number or Boolean to be properly visualized.**

The aggregator applied to the series defines how the data is combined based on the chosen resolution. The above example has the resolution set to 10 seconds. This means if your devices are reporting temperature once per second, each data point on the graph will be the average of 10 temperature readings.

Each series can also aggregate the same attribute across multiple devices; therefore, **Device IDs / Tags** should be populated with a [device query](/devices/device-queries) to aggregate data for one or more devices per series.

![Time Series Settings](/images/dashboards/time-series-settings-tags.png "Time Series Settings")

When this is graphed, it is now a single series that contains the average temperature of both devices.

You also have the option of setting a custom color for each line on the time series graph. Colors will automatically be assigned in the event you do not assign a color.

The minimum and/or maximum y-axis values may be manually set for each data series. If at any point the line extends beyond a defined minimum or maximum value, the time series line will disappear off the edge of the graph until the data returns to the defined window.

If you choose not to define a y-axis minimum or maximum value, the time series graph will automatically define a scale based on the data set it is currently rendering for the data series.

The Segment Label (in this case "Current A" is used to name this particular data series, and will be the label shown in the graph legend.  The y-axis label is used to name the y-axis for this series - if it is left blank, the name of the selected attribute is used.  Series that use the same y-axis labels share that axis on the resulting graph.

Finally, when the Line Display Type is set to "Line", each segment also takes a "Line Weight" property, which defines the thickness of the line displayed on the chart for that segment on a 1 (thin) to 5 (thick) scale.
