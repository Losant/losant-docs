# Time Series Graph

The Time Series Graph allows you to display historical data across one or more devices. Hovering your mouse over the graph will display a tooltip, which shows the value of each series at that moment in time. Move your mouse left or right to view graph data back or forward in time respectively.

![Time Series Dashboard](/images/dashboards/time-series-dashboard.png "Time Series Dashboard")

## Configuration

There are a number of configuration options for the graph as a whole, as well as its individual series.

### Data Type

![Time Series Settings](/images/dashboards/time-series-settings.png "Time Series Settings")

The Time Series Graph can display points as a **live stream** (rendering a point on the graph as soon as the data hits the platform) or as an **historical** graph. Each style has its own advantages:

* **Live stream** graphs provide feedback with more immediacy than historical graphs, as they do not require a dashboard data refresh to populate with new data. If a graph segment references multiple devices by ID or tag, a point will be rendered on the graph for that segment anytime any of the devices reports state for the chosen attribute.
* **Historical** graphs allow for data to be aggregated according to a number of rules (based on time ranges, mathematical functions and the combination of data from multiple sources), and they also allow for [viewing past dashboard states](/dashboards/overview/#viewing-past-dashboard-states).

### Duration and Resolution

In your block configuration, you must set a default **duration** and **resolution** for the Time Series Graph. These fields allow you to configure how far into the past to view and how to group the data together. The available resolutions will change based on what you specify for the duration. For example, when you choose 30 days of data, the smallest resolution available is 60 minutes. This is because smaller resolutions result in more data points, and too much data can't be graphed by the browser and is hard to understand by the viewer.

The resolution and the aggregator specified in the block data section work together in order to generate a data point. For example, if the resolution is 60 minutes and the aggregator is `MEAN`, Losant will average all of the data together in 60-minute increments to create a single point on the graph.

Note that if **live stream** is selected as the data type, the "resolution" selector will disappear from the block configuration.

### Block Data

The Time Series Graph is configured as individual series. The example above is displaying the weather, dew point and humidity levels over the past 24 hours. Since each is configured as a separate series, each one displays as its own graph on the chart.

To add a new segment to the graph, click the "Add Segment" button at bottom of the configuration panel. At least one series is required.

![Time Series Settings](/images/dashboards/time-series-settings-tags.png "Time Series Settings")

There are a number of configuration options for each series:

* **Device IDs / Tags** is a [device query](/devices/device-queries/) for selecting the device(s) that should be part of the query. At least one ID or one tag is required.
* **Attribute** is the single [device state attribute](/devices/state/) to graph in the series. The data type of the state attribute must be set to Number or Boolean to be properly visualized.
* **Aggregation** is the aggregator applied to the series based on the chosen devices and resolution. The above example has the resolution set to 20 minutes. This means if weather data is being reported once every five minutes, each data point on the graph will be the average of four readings. Note that if **live stream** is chosen for the graph's data type, this option will disappear.

There are also a handful of parameters that only affect the graph's display properties and not the raw data returned by the series configuration:

* **Series Label** is the label to apply to the data series in the graph's legend and tooltip.
* **Color** is the color used to represent the data in the chart. These are automatically assigned as series are added, but each can be overridden.
* **Display As** is the graph type. "Line" is the default, but series may also be displayed as bar charts or area charts.
* <strong><a href="https://www.mathsisfun.com/data/cumulative-tables-graphs.html" target="\_blank">Cumulative</a></strong>, when checked, means that the point graphed at any given time is the sum of that point plus all previous points that are currently displayed.
* **Connect Line Across Data Gaps**, when checked, will display a line between all reported data points. If not checked, the line connecting data points will break if no data was reported for that resolution bucket. If "Bar" is selected for the display style, this option is disabled.
* **Dot Weight** is the thickness of the dot applied to the series. If "Bar" is selected for the display style, this option is disabled.
* **Line Weight** is the thickness of the line applied to the series. If "Bar" is selected for the display style, this option is disabled.
* **Line Type** is the style of the line applied to the series. If "Bar" is selected for the display style, this option is disabled.
* **Y Axis Label** is an optional label to apply to the Y Axis. If provided, this will draw a new axis for this series; however, if any two axes labels, minimums and maximums all match, only one of the two axes will be drawn on the graph. If left blank, the default left axis is used for the series.
* **Y Axis Min** and **Y Axis Max** are user-defined caps at the bottom and top of the chart, respectively. Data for the series will be graphed on this scale. If you choose not to define a minimum or maximum value, the Time Series Graph will automatically define a scale based on the data set it is currently rendering for the data series.

## Changing Graph Time Ranges

If your Time Series Graph is displaying **historical** data, it is possible to change the graph's duration and resolution while viewing the dashboard. This allows for a quick glimpse of the data from your Time Series Graph at different time range settings without having to edit your block configuration.

To change your graph's duration and/or resolution, click the time selector in the top right corner of the block. This will display a dropdown with other time range options. (Your resolution may automatically change to a new value if its current value is not valid given a new duration.)

![Time Series Runtime Config](/images/dashboards/time-series-graph-runtime-config.png "Time Series Runtime Config")

After selecting a new time range, click **Update** to change your graph to the new time selection. **Note:** This will not change the block's default configuration; if you leave the dashboard and return, the graph will reset to the defaults you chose in the block configuration.
