# Custom Chart

The Custom Chart Block is an advanced Block that allows you to create custom data visualization by utilizing [Vega-Lite](https://vega.github.io/vega-lite/). If you would like a specific visualization that's not already a Losant Dashboard Block, the Custom Chart Block supports a wide array of visualization types like [Scatterplots](https://vega.github.io/vega-lite/examples/point_2d.html), [Bubble Plots](https://vega.github.io/vega-lite/examples/circle_natural_disasters.html), or even [layer visualizations together](https://vega.github.io/vega-lite/examples/layer_falkensee.html).

![Data Table Scatter Plot](../images/workflows/custom-chart-data-table-scatter-plot.png "Data Table Scatter Plot")

## Configuration

Configuring the Custom Chart Block is broken up into two sections:

### Queries

![Queries](/images/workflows/custom-chart-queries.png "Queries")

All query types include a **Query Name** property which is how each individual query's data is referenced in the Vega-Lite configuration.

#### Time Series Queries

Time series queries provides a dataset that includes the value of a single attribute from a selected device over a duration of time at a selected resolution. The values returned from the query will be returned as an array of objects in the form of:

```json
[
  { "time": <time>, "value": <value> },
  { "time": <time>, "value": <value> },
  { "time": <time>, "value": <value> }
]
```

The values returned will reflect the selected attribute's value specified at the reported time. This is the same data that is used in the Time Series Block.

![Time Series Query](/images/workflows/custom-chart-time-series-query.png "Time Series Query")

The parameters of the Time Series Query include:

* **Query Name** is what will be referenced in the Vega-Lite configuration in order to access the returned dataset.
* **Device IDS / Tags** is a [device query](../devices/device-queries/) for choosing which devices' data you want to access.
* **Attribute** is the device attribute whose value will be returned in the query. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Duration** is how far into the past you want to look at the data.
* **Resolution** is how your data will be grouped. These options will change based on what you specify for the duration.
* **Aggregation** determines how all the available data in each resolution group should be aggregated before being read. For example, choosing "MEAN" will average all data points together before displaying within the gauge.

#### Gauge Queries

Guage queries allow you to query a single attribute from a selected device. You can choose to return either the last reported value of the attribute or the value over a selected duration of time with a selected aggregation performed on that data. This query will return an object in the form of `{ "time": <time>, "value": <value> }`. The value of `time` in the returned data is the time that the query was made and the value of `value` is the data of the attribute after the selected aggregation has been performed.

![Gauge Query](/images/workflows/custom-chart-gauge-query.png "Gauge Query")

The parameters of the Gauge Query include:

* **Query Name** is what will be referenced in the Vega-Lite configuration in order to access the returned dataset.
* **Device IDS / Tags** is a [device query](../devices/device-queries/) for choosing which devices' data you want to access.
* **Attribute** is the device attribute whose value will be returned in the query. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Duration** is how far into the past you want to look at the data.
* **Aggregation** determines how all the available data returned should be aggregated before being read. For example, choosing "MEAN" will average all data points together before displaying within the gauge. This field is only available if "Data Type" is set to "Historical", and any of the following conditions applies:
    * Duration is set to anything other than "Last received data point"
    * A device tag is supplied in the device query
    * More than one device ID is supplied within the device query

#### Data Table Queries

Data table queries allow you to query any data that is stored on a data table. The data table query will return an array of your data table rows where the column names will be the keys you will reference. We will automatically generate a list of columns that are available to query as well as all default row data.

![Data Table Query](/images/workflows/custom-chart-data-table-query.png "Data Table Query")

Building this query is done the same way as building a query in the [Table: Get Rows Node](../workflows/data/table-get-rows/#query-fields), where an array of individual queries can be joined with an "OR" or "AND" operator.

### Vega Configuration

Once you have a query, you can write a custom Vega-Lite configuration. We will provide a default configuration that includes the Vega-Lite schema and will be sized to the Dashboard Block size. The default configuration will not be valid as you will have to provide the data.

![Default Vega Configuration](/images/workflows/custom-chart-default-vega-configuration.png "Default Vega Configuration")

When referencing a query, you will need to do so as a [named data source](https://vega.github.io/vega-lite/docs/data.html#named) based on the what is entered in the 'Query Name' field. All queries will be formatted as JSON data so you will not need to set a data format in your configuration. Keep in mind that you can use any valid [Vega-Lite data source](https://vega.github.io/vega-lite/docs/data.html#types-of-data-sources) to populate your chart, not just any of your previously created queries.

For more information on configuring Vega-Lite, please reference the [Vega-Lite documentation](https://vega.github.io/vega-lite/docs/).

### Examples

#### Time Series Bar Chart

![Simple Time Series Bar Chart Result](/images/workflows/custom-chart-time-series-simple-bar-chart-result.png "Simple Time Series Bar Chart Result")

```json
{
  "width": {{block.width}},
  "height": {{block.height}},
  "autosize": {
    "type": "fit",
    "contains": "padding"
  },
  "description": "A simple time series bar chart.",
  "data": {
    "name": "time-series-0"
  },
  "mark": "bar",
  "encoding": {
    "x": {
      "field": "time",
      "type": "temporal",
      "timeUnit": "minutes"
    },
    "y": {
      "field": "value",
      "type": "quantitative",
      "axis": {"title": "Cents"}
    }
  }
}
```

#### Layered Time Series Line Chart with Gauge as Average Line

![Layered Time Series Line Chart with Gauge as Average Line](../images/workflows/custom-chart-layered-time-series-gauge-chart-result.png "Layered Time Series Line Chart with Gauge as Average Line")

```json
{
  "width": {{block.width}},
  "height": {{block.height}},
  "autosize": {
    "type": "fit",
    "contains": "padding"
  },
  "layer": [
    {
      "data": {
        "name": "time-series-0"
      },
      "mark": "line",
      "encoding": {
        "x": {
          "field": "time",
          "type": "temporal"
        },
        "y": {
          "field": "value",
          "type": "quantitative",
          "axis": {
            "title": "Cents"
          }
        }
      }
    },
    {
      "data": {
        "name": "gauge-0"
      },
      "mark": "rule",
      "encoding": {
        "y": {
          "field": "value",
          "type": "quantitative"
        },
        "size": {"value": 2}
      }
    }
  ]
}
```

#### Data Table Scatter Plot

![Data Table Scatter Plot](../images/workflows/custom-chart-data-table-scatter-plot.png "Data Table Scatter Plot")

```json
{
  "width": {{block.width}},
  "height": {{block.height}},
  "autosize": {
    "type": "fit",
    "contains": "padding"
  },
    "description": "A simple time series bar chart.",
  "data": {
      "name": "data-table-0"
  },
  "mark": "point",
  "encoding": {
    "x": {
      "field": "PlaceholderNumber",
      "type": "quantitative"
    },
    "y": {
      "field": "PlaceholderNumber2",
      "type": "quantitative"
    }
  }
}
```