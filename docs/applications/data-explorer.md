# Data Explorer

The Application Data Explorer allows you to easily explore, aggregate, and analyze historical data across all of the devices in an application.

The data explorer can be accessed through the "Data Explorer" link in the Application navigation bar:

![Data Explorer Link](/images/applications/data-explorer-link.png "Data Explorer Link")

There are three main sections to the data explorer.  First, the inputs at the top, which control the time range, resolution, and aggregation of the data.  Second, the controls on the left side which determine what devices and attributes we are gathering data from.  And finally, the center section, which displays the data in various ways (in graph form, in table form, or in aggregation form).

## Time Controls

![Time Controls](/images/applications/data-explorer-time-controls.png "Time Controls")

1.  **Start**: controls the start of the time range of the data to display.
2.  **End**: controls the end of the time range of the data to display.
3.  **Back**: moves the time range back by the current time range duration.  For example, if you are looking at a 3 hour time range, this will move the time range into the past by 3 hours.
4.  **Forward**: moves the time range forward by the current time range duration.
5.  **Aggregation**:  the aggregator function to use for accumulating the data into the selected resolution.  Defaults to MEAN (i.e., the average of all the values in a resolution window).
6.  **Resolution**: The size of the aggregation window, which determines how many points will be displayed for a time range.  For example, a three hour time range at five minute resolution would have 36 data points - one for each five minute period in those three hours.

## Data Controls

<div class="slim-image-container">
<img src="/images/applications/data-explorer-data-controls.png" alt="Data Controls" title="Data Controls" width="250" />
</div>

1.  **Add a Device**: This dropdown lets you select one or more devices that you would like to display data for.
2.  **Remove a Device**: Clicking this 'x' will remove the device from the data display.
3.  **Hide/Show a Device**: Clicking this icon will allow you to temporarily hide or show the data for a device.
4.  **Attributes**: This shows the available attributes to display for the given selected devices.  As a note, this will only show `number` attributes.
5.  **Hide/Show an Attribute**: Clicking this icon will allow you to temporarily hide or show the data for an attribute.

## Data Display

![Data Display](/images/applications/data-explorer-data-display.png "Data Display")

There are a couple choices for displaying the data. By default it displays in graph form,
but you can also choose to display all of the data points in tabular form. The third option for display just shows the over aggregates for the time range - extremely useful if you are looking for general information over a period.  For both the tabular display and the aggregate display, you can download the data as a CSV file for use in other applications.
