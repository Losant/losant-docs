# Device State Table

The Device State Table allows you to display attribute data from one or more devices.

![Device State Table](/images/dashboards/device-state-table-example.png "Device State Table")

## Configuration

### Duration

To view only the current state of your device(s), select "Last received data point". To view device states reported over a longer period, select any other option.

![Device State Table Duration](/images/dashboards/device-state-table-duration.png "Device State Table Duration")

### Select Devices

Here you choose which devices are queried for data for the block. Each reported state for each device is given a separate row in the table, and if a duration other than "Last received data point" is selected, a device displayed only if it has state reported within the the selected duration.

![Device State Table Devices](/images/dashboards/device-state-table-block-data.png "Device State Table Devices")

### Configure Block

Once you have selected the devices, you can now configure what columns you want to display in the block. By default, the columns for Device Name and Timestamp are added - but no rows of data will be displayed until you add an Attribute column (a column corresponding to a device attribute).

The column Header and the column Cell both support [string templates](/workflows/accessing-payload-data/#string-templates), and each can also be wrapped in [Markdown](http://commonmark.org/help/). There is a single variable available in the Header template, `name`, which is the name of the data source for the column (i.e., in the case of an attribute column, `name` will be the name of the attribute).  In the Cell template, the `name` variable is available, as well as a `value` variable, which is the actual value backing that cell.

The default Header and Cell templates are extremely simple - `{{name}}` and `{{format value}}` respectively. However, you can make them as complicated as you need - using standard Markdown syntax will allow you to create links and bring in images. Combined with Losant's [built-in helpers](/workflows/accessing-payload-data/#conditional-block-helpers), this allows for complex template construction.

![Device State Table Column Configuration](/images/dashboards/device-state-table-column-config.png "Device State Table Column Configuration")

### Default Table Sorting

After all columns have been added to your table, you have the option of setting a default sort method from the block editing screen. In the block preview, click on a column header to select it as the default column to sort by. Click the column a second time to switch the order from ascending to descending.

When viewing the block on the dashboard, you may sort by the other columns at any time by clicking the appropriate column header. However, should you refresh the page, the block's sort order will revert to the default method that was set while editing the block.

![Device State Table Sort](/images/dashboards/device-state-table-sort.png "Device State Table Sort")
