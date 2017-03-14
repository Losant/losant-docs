# Gauge

The Gauge block displays a single attribute value, either as a number or as a visual representation in a dial.

![Gauge](/images/dashboards/gauge-example.png "Gauge")

## Configuration

### Block Type

Gauge blocks currently support two types. Additional types will be added in future releases.

![Gauge Type](/images/dashboards/gauge-block-type.png "Gauge Type")

* **Number Gauge** displays a value as a single number.
* **Dial Gauge** displays the value as a number, but also provides a gauge representation to show where that number stands against a minimum and maximum value provided by you.

When "Dial Gauge" is selected, additional configuration options become available:

* **Min** and **Max** values are required. Each must be a number, and Min must be less than Max. These numbers determine the upper and lower bounds of your dial gauge.
* Optionally, the gauge value and minimum and maximum bounds can be **displayed as a percentage** instead of raw numbers.

Values that go above or below the set `Min` or `Max` will continue to display in the middle of the gauge, but the gauge itself will either be empty or full, depending on if the value falls below the `Min` or exceeds the `Max`, respectively.

### Number Display Rules

The value displayed in the gauge block can be rounded or represented a few different ways, and depending on the value being returned by your devices, these rules can greatly enhance the usability of the gauge block (especially for very large or very small numbers).

* For the **Precision Type**, choose **Significant Digits** (default) to round the value based on the number of digits selected. To always display a certain number of decimal points, choose **Floating Point**.
* For the **Digits**, enter any integer greater than 0. This number will be applied to the Precision Type previously selected. Default is 4.

For example, say you have a gauge displaying the current outside temperate. The actual number reported by the device is **64.67**. Here is how different number display rules would represent that number:

|                    | 1    | 2     | 3      | 4       |
|--------------------|------|-------|--------|---------|
| Significant Digits | 6e+1 | 65    | 64.7   | 64.67   |
| Floating Point     | 64.7 | 64.67 | 64.670 | 64.6700 |

### Duration

To view current state of your device(s), select "Last received data point". To view an aggregation of your data over a given time period, choose any other value.

![Gauge Duration](/images/dashboards/gauge-duration.png "Gauge Duration")

Note that, when choosing a value other than "Last received data point", it is necessary to choose an aggregation method in the block data.

### Block Data

The block data takes five parameters, three of which are required:

![Gauge Block Data](/images/dashboards/gauge-block-data.png "Gauge Block Data")

* **Label** is the text displayed beneath number / dial representation of your device(s) state. This can be any value, but you will want it to properly represent the data displayed along with it. HTML entities and <a href="https://daringfireball.net/projects/markdown/syntax" target="_blank">Markdown</a> are allowed here.
* **Device IDS / Tags** is a [device query](/devices/device-queries/) for choosing which devices are displayed within the gauge.
* **Attribute** is the device attribute whose value will be displayed in the gauge. This attribute must be of the type `Number`. Note that if data from more than one device is being displayed, each of those devices must supply the same attribute name.
* **Color** can only be set when the gauge type is set to "Dial". The color picker defaults to green, but any color may be selected as the default gauge color.
* **Aggregation Type** is only visible when Duration is set to anything other than "Last received data point", OR when a device tag is supplied in the device query, OR if more than one device ID is supplied within the device query. This determines how the all the available data returned should be aggregated before displaying the value. For example, choosing "MEAN" will average all data points together before displaying within the gauge.

### Conditional Gauge Colors

If the gauge type is set to "Dial", you may optionally create a list of conditions that change the color of the gauge depending on the query's returned value. This works similarly to the [indicator block](/dashboards/indicator/), in that the first [expression](/workflows/accessing-payload-data/#expressions) that returns `true` determines the gauge's color. If none of them returns `true`, the default color set in the "Block Data" section will be the gauge's color.

![Gauge Block Conditions](/images/dashboards/gauge-block-conditions.png "Gauge Block Conditions")

The conditions can be arranged via drag-and-drop to set their priority relative to one another. Two variables are available when writing the expressions:

* `{{value}}` represents the raw numeric value returned from the query.
* `{{percent}}` is the percentage the value represents when compared against the minimum and maximum values set in the dial gauge configuration. For example, given a minimum of 10 and a maximum of 50, when {{value}} is equal to 40, the corresponding {{percent}} is 75.
