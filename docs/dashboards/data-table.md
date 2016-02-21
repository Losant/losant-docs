# Data Table

The Data Table allows you to display states returned from one or more devices.

![Data Table](/images/dashboards/data-table-example.png "Data Table")

## Configuration

### Duration

To view only the current state of your device(s), select "Last received data point". To view device states reported over a longer period, select any other option.

![Data Table Duration](/images/dashboards/data-table-duration.png "Data Table Duration")

### Block Data

The block data for the data table accepts two parameters:

![Data Table Block Data](/images/dashboards/data-table-block-data.png "Data Table Block Data")

* **Device IDS / Tags** is a [device query](/devices/device-queries.md) for choosing which devices are displayed within the table. Each device is given a separate row in the table, and if a duration other than "Last received data point" is selected, each device's reported state is displayed if it falls within the selected duration.
* **Attributes** is a comma-separated list of which attributes appear as columns within the table. If any device does not report one of the specified attributes, the column will be blank for that device.
