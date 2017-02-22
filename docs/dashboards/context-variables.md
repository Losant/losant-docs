# Context Variables

Dashboards can take a series of "context variables" for changing not only what data to display within your blocks, but also how to display that data on a per-block basis. This makes it possible to set up a common dashboard that can display data specific to any device or attribute.

![Context Version A](/images/dashboards/context-example-cincinnati.png "Context Version A")

![Context Version B](/images/dashboards/context-example-phoenix.png "Context Version B")

## Defining Context Variables

Before a context variable can be referenced in a block, the variable must first be defined within your dashboard settings. From the settings menu, click "Manage" next to "Dashboard Context". Or, if you do not have any variables defined, click the "Add Context" button.

<img style="width: 328px; margin: 0 auto; display: block;" src="/images/dashboards/context-manage-link.png" alt="Manage Context Link" />

Alternatively, "Context Variables" can be reached from the left column of your dashboard's "Edit Settings" page.

Each context variable must be given a **unique name**, which is how the variable is referenced in your dashboard configuration. Each variable type also has its own additional configuration options.

![Add Context Variable](/images/dashboards/context-add-variable.png "Add Context Variable")

To add a new variable, click the "Add Variable" button on the "Context Variables" screen and then select your variable type from the dropdown menu. There are four variable types ...

### Device IDs

A "Device ID" is a [device query](/devices/device-queries/) that takes a single device at a time. Device IDs take three additional parameters:

![Device ID Context](/images/dashboards/context-deviceId.png "Device ID Context")

*   **Application ID** is the Losant [application](/applications/overview) to which any selected device must belong.
*   **Default Value** is the device ID to use when no value is provided by the user.
*   **Validation** is optional; it is a [device query](/devices/device-queries/) that accepts device IDs and/or [tags](/devices/overview/#device-tags) that the variable must match. If both IDs and tags are provided, the variable may match a specific ID, or the tag must be applied to the device. If multiple tags are defined in validation, the device must match **all** tags (or a provided ID). Note that the default value does not have to match your defined validation rules.

If a device ID is used in a query with an attribute that is not defined on the device, the block that is referencing the variable will fail to load.

### Attributes

An "Attribute" is a single [device attribute](/devices/overview/#device-attributes). Attributes take three additional parameters:

![Attribute Context](/images/dashboards/context-attribute.png "Attribute Context")

*   **Application ID** is the Losant [application](/applications/overview) from which the attribute must originate.
*   **Default Value** is the attribute to use when no value is provided by the user.
*   **Validation** is optional; it is an array of attributes that the user is allowed to select. Every unique attribute from every device within the chosen application will be in the menu. Select one or more of these attributes to limit the user's options; alternatively, by providing no validation, the user may select any attribute from the application. Note that the default value does not have to match your defined validation rules.

The attribute can be of any type (`Number`, `GPS`, etc.) but certain attribute types will fail to display in a number of block configurations. (For example, data for a `String` attribute cannot be displayed on a time series graph for most aggregation types.)

### Numbers

A "Number" variable is simply a number: positive or negative, whole or decimal. Number variables take three additional parameters:

![Number Context](/images/dashboards/context-number.png "Number Context")

*   **Default Value** is the number to use when no value is provided by the user. If min and/or max are defined, the default value **must match** the validation rules.
*   **Min** is an optional minimum value (inclusive) that the user can set in the variable.
*   **Max** is an optional maximum value (inclusive) that the user can set in the variable.

### Strings

"String" variables are simply an arbitrary string of characters. Strings take two additional parameters:

![String Context](/images/dashboards/context-string.png "String Context")

*   **Default Value** is the string to use when no value is provided by the user.
*   **Validation** is an optional [regular expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) that, when set, the user's input for the variable must match. Note that the default value does not have to match the validation.

## Setting Context Variables

Once your context variables have been defined, there are three different ways in which the values of those can be set in your dashboard:

### Context Menu

The easiest way to change context is to set it within the "Dashboard Context" section of the settings dropdown menu. Every variable you have defined will appear in this form, and all inputs will validate against any rules you have defined.

<img style="width: 329px; margin: 0 auto; display: block;" src="/images/dashboards/context-menu.png" alt="Context Menu" />

Device IDs and attributes will take the form of dropdown menus with all valid entries available for selection. Numbers and strings are simple text inputs.

Any input that is left blank is currently set to its default value. Enter any values you would like to change and click the "Update" button at the bottom of the form, and your dashboard will update to reflect the new context.

To clear all values and return the dashboard to its default state, click "Reset to Defaults".

### Direct URL Manipulation

Dashboard context settings are stored on the page's URL and changes are logged in your browser's history – meaning that you can use your browser's back and forward arrows to navigate through context changes. This also means that context values can be set by directly editing the page's URL.

Context variables are stored on the [query string](https://en.wikipedia.org/wiki/Query_string), and each takes the format of `ctx[VARIABLE_NAME]=NEW_VALUE`. (Values must be [encoded](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent).) For example, to set a context variable called "myString" to the value of "hello world", you would append `?ctx[myString]=hello%20world` to your dashboard's URL.

These URLs are valid so long as the context variable's name remains the same, and the given values pass its respective validation rules. Therefore, context settings can be bookmarked or linked to from elsewhere on the Internet.

### Links Within the Dashboard

There are a number of places within dashboards where, using [Markdown](https://daringfireball.net/projects/markdown/syntax) and [Handlebars templates](http://handlebarsjs.com), you may create a custom link tag:

*   The dashboard's description, which is defined under your dashboard's settings menu.
*   [Popup templates](/dashboards/gps-history/#popup-style-configuration) in GPS history blocks.
*   [Help blocks](/dashboards/input-controls/#help-blocks) within input controls blocks.
*   [Condition labels](/dashboards/indicator/#conditions) in indicator blocks.
*   Header and cell templates in [data tables](/dashboards/data-table/).

The URLs can be manually constructed; or, there is a [Handlebars helper](/workflows/accessing-payload-data/#string-templates) to make it easier to build these links.

![Linking to Dashboard Context](/images/dashboards/context-url-in-template.png "Linking to Dashboard Context")

**Note**: Context variables defined in the URL are subject to the same validation rules as variables defined through the context menu. Setting a value for a nonexistent context variable – or setting a value that does not pass validation – will cause the dashboard to fail to load.

## Using Context Variables

All context variables are scoped under a `ctx` object, and that object can be referenced in a number of places within your dashboard's configuration. For example, to display the value for the variable "myString", or to use it in a block's query configuration, wrap a reference to object and key in a [Handlebars template](http://handlebarsjs.com) like `{{ctx.myString}}`.

![Context in a Dashboard Description](/images/dashboards/context-in-description.png "Context in a Dashboard Description")

Context variables can also be referenced in [block helpers](/workflows/accessing-payload-data/#conditional-block-helpers) and [format helpers](/workflows/accessing-payload-data/#format-helpers) like any other variable (e.g. `{{upper ctx.myString}}`).

Any variable whose value is not set by the user will return its default value when referenced.

Context variables of all types can be used in the dashboard's description and in each block's title. Additionally, each variable type can be used a number of different ways throughout a dashboard's configuration ...

### Device IDs

![Device ID Context Use](/images/dashboards/context-use-deviceId.png "Device ID Context Use")

A Device ID value can, for example, be used to ...

*   Display data from a specific [device](/devices/overview) within your dashboard blocks
*   Highlight one device against an array of devices in [time series graphs](/dashboards/time-series-graph/)
*   View data from a single device at a time within a [data table](/dashboards/data-table/)
*   Color-coding [map pins](/dashboards/gps-history/#advanced-pin-style-configuration), [gauges](/dashboards/gauge/#conditional-gauge-colors) and [indicator blocks](/dashboards/indicator/#conditions) when viewing a specific device

### Attributes

![Attribute Context Use](/images/dashboards/context-use-attribute.png "Attribute Context Use")

Changing attributes in context can allow users to ...

*   Change the attribute to compare other values against in a [pie chart](/dashboards/pie-chart/)
*   [Graph](/dashboards/time-series-graph/) one changing attribute at a time from multiple devices
*   Bold or otherwise highlight a column in a [data table](/dashboards/data-table/)

### Numbers

![Number Context Use](/images/dashboards/context-use-number.png "Number Context Use")

Currently there are no blocks whose returned data depends on a number attribute, but there are many ways in which a block's appearance can be altered using a number variable, such as:

*   Minimum and maximum values can be defined on the axes of [time series graphs](/dashboards/time-series-graph) and [bar charts](/dashboards/bar-charts), as well as the bounds of a [gauge block](/dashboards/gauge).
*   Ranges on [input control blocks](/dashboards/input-controls/#range-inputs) can also have minimums, maximums and default values defined by number context variables.

### Strings

![String Context Use](/images/dashboards/context-use-string.png "String Context Use")

There are a number of possible uses for string attributes:

*   Pass a value to the filter in the [event list](/dashboards/event-list) – or other resource lists.
*   Change the axis labels in [time series graphs](/dashboards/time-series-graph) or [bar charts](/dashboards/bar-charts).
*   Set a URL for the site to display in an [external website block](/dashboards/external-website/).
*   Send a different device command from the [input controls block](/dashboards/input-controls/#button-triggers).
*   Define a custom map center in the [GPS history](/dashboards/gps-history/#default-viewport) or [heatmap](/dashboards/gps-heatmap/#default-viewport) blocks

## Deleting Context Variables

![Delete Context Variable](/images/dashboards/context-delete.png "Delete Context Variable")

To delete a context variable, simply click the "delete" icon in the top right corner of the variable's configuration panel. **Note:** Deleting a variable will potentially break any dashboard block that is referencing that variable, and any URLs referencing that variable will fail to load.
