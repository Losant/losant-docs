# Indicator

The Indicator block displays a color and message of your choosing based on the result returned from a [gauge query](workflows/data/gauge-query/).

![Indicator Example](/images/dashboards/indicator-example.png "Indicator Example")

## Query Configuration

When building your query, you must select at least one device or at least one device tag, and after doing so, you must select an attribute from which to return data. A duration must also be selected, though the value defaults to "Last received data point".

![Indicator Query Configuration](/images/dashboards/indicator-query-config.png "Indicator Query Configuration")

In the event that a duration other than "Last received data point" is selected, or if more than one device is selected, or if at least one device tag is selected, it will also be necessary to select an aggregation method. This is the mathematical operation by which your query will boil down all data from the selected devices and duration into a single value. The default aggregation method is `MEAN`.

## Query Result

If no data is returned, or if the selected attribute cannot be aggregated by the chosen method (see below), the result of the query will be `undefined`.

Depending on the type of attribute selected, the query can return data of varying types ...

### Number Attributes

Numbers are the easiest attribute type to work with as, no matter the aggregation method, they will always return a number.

### Boolean Attributes

If querying for the last received data point of a boolean attribute for a single device, the result will return as `true` or `false`.

If the boolean attribute is being aggregated – as the result of a query across multiple devices or a larger duration – then all `false` points will be treated as a **0** and all `true` points will be treated as a **1**. Then, the result will return as a **number** representing the following:

*   `MIN` and `MAX` aggregations will return as `0` (false) or `1` (true).
*   `MEAN` aggregations will return as a number between 0 and 1 (inclusive), which is the average of all data points across the query.
*   `SUM` will return as a whole number greater than or equal to 0, which is equal to the number of `true` data points across the query.
*   `COUNT` will return as a whole number greater than or equal to 0, which is equal to the total number of data points across the query.

### GPS and String Attributes

When requesting the last received data point of a single device, the result will return as a string.

When requesting aggregated data for such an attribute, **all queries will return as `undefined` except for a `COUNT` aggregation**, which will return as a number representing the total number of data points across the query.

To expand a condition for editing, simply click the header. You can also choose to expand or collapse all conditions by clicking the link at the top right corner of the section.

## Conditions

When a query returns a result, that result is evaluated against all the set conditions, starting with the top-most item in the list. The first condition that returns true has its corresponding label and color displayed within the indicator block.

![Indicator Conditions](/images/dashboards/indicator-condition-config.png "Indicator Conditions")

### Creating Conditions

You may set as many conditions to test the result against as you wish. New conditions can be added by clicking the "Add Condition" button, and the conditions can be reordered by dragging and dropping them up and down the list. Conditions can also be removed by clicking the "Delete" icon to the right of each panel's title.

### Template Variables

Two template variables are available to you when configuring conditions:

*   `{{value}}`: The result of the query.
*   `{{time}}`: A [Date object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) representing the query's time. This is usually combined with the "format" Handlebars helper to return the time in a more readable manner (such as `{{format time 'llll'}}`).

### Condition Configuration

Each condition takes three parameters:

*   **Expression**: The [expression](/workflows/accessing-payload-data/#expressions) to evaluate. This should include either the `{{value}}` or the formatted `{{time}}` variable, and a static value against which to compare the result.
*   **Label**: The text to display within the indicator block. This field is optional, and may include [string templates](workflows/accessing-payload-data/#string-templates) and [Markdown](http://commonmark.org/help/). The color of the text will automatically switch between black and white depending on the block's chosen background color.
*   **Color**: The background color of the indicator block. Default is green.

## Default Condition

![Indicator Default Condition](/images/dashboards/indicator-default-condition.png "Indicator Default Condition")

If none of the set conditions return true, the indicator block will display a default label and color. Configuration is the same as for a condition, except no expression is set.
