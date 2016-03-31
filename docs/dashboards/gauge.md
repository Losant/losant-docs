# Gauge

The Gauge block displays a single attribute value, either as a number or as a visual representation in a dial.

![Gauge](/images/dashboards/gauge-example.png "Gauge")

## Configuration

### Block Type

Gauge blocks currently support two types. Additional types will be added in future releases.

![Gauge Type](/images/dashboards/gauge-block-type.png "Gauge Type")

* **Number Gauge** displays a value as a single number.
* **Dial Gauge** displays the value as a number, but also provides a gauge representation to show where that number stands against a minimum and maximum value provided by you. When "Dial Gauge" is selected, the "Min" and "Max" values are required, and each must be a number.
* The **Precision** field allows you to specify the number of digits of precision to display in the gauge (the default is 4).

### Duration

To view current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value.

![Gauge Duration](/images/dashboards/gauge-duration.png "Gauge Duration")

Note that, when choosing a value other than "Last received data point", it is necessary to choose an aggregation method in the block data.

### Block Data

The block data takes four parameters, three of which are required:

![Gauge Block Data](/images/dashboards/gauge-block-data.png "Gauge Block Data")

* **Label** is the text displayed beneath number / dial representation of your device(s) state. This can be any value, but you will want it to properly represent the data displayed along with it.
* **Device IDS / Tags** is a [device query](/devices/device-queries.md) for choosing which devices are displayed within the gauge.
* **Attribute** is the device attribute whose value will be displayed in the gauge. This attribute must be of the type `Number`. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Aggregation Type** is only visible when Duration is set to anything other than "Last received data point", OR when a device tag is supplied in the device query, OR if more than one device ID is supplied within the device query. This determines how the all the available data returned should be aggregated before displaying the value. For example, choosing "MEAN" will average all data points together before displaying within the gauge.
