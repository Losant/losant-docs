# GPS History

The GPS History block shows the path of GPS datapoints across one or more devices. The map visualizes the historical path of each device as a connected line, with a start and end bubble.

![GPS History Dashboard](/images/dashboards/gps-history-example.png "GPS History Dashboard")

The map will automatically pan and zoom to display all the available data retrieved for the block's configuration. However, you are free to pan and zoom the map on your own.

## Configuration

### Duration

![GPS History Duration](/images/dashboards/gps-history-duration.png "GPS History Duration")

To view the current location of your devices, select "Last received data point". This will show your devices on the map as green pins.

To view your devices' locations over a given period of time, choose any other value for duration. Your devices will show on the map as red starting point pins and green ending point pins, with paths connecting the two showing how the device traveled over the given duration.

![GPS History Side by Side](/images/dashboards/gps-history-side-by-side.png "GPS History Side by Side")

### Block Data

The block data takes two parameters:

![GPS History Block Data](/images/dashboards/gps-history-block-data.png "GPS History Block Data")

*   **Device IDS / Tags** is a [device query](/devices/device-queries) for choosing which devices are displayed on the map.
*   **Attribute** is the device attribute that contains the location data. The attribute must be of type `GPS String`, and any attribute reported by the selected devices that is not of the `GPS String` type will not be available to choose. If displaying multiple devices on the map via tags or multiple IDs, each device must provide the same attribute name.

### Point Display Configuration

![Point Display Configuration](/images/dashboards/gps-history-point-config.png "Point Display Configuration")

The history block optionally allows templating of the icons and popups for the various points being displayed.  By default, the templates place a red marker at the oldest (starting) point and a green marker at the newest (current) point, and clicking either will display a popup with the time and coordinates for that point.

Icon templates are rendered using [Handlebars](http://handlebarsjs.com/). The template must resolve to a single url pointing at an image with a size of 30x70 or larger using the same ratio (the center of the image is centered over the point). Popup templates are also rendered using [Handlebars](http://handlebarsjs.com/), and the result is treated as [Markdown](http://commonmark.org/help/) for display in the popup. If either the icon or popup render to a blank result, there is no icon or popup displayed for that point. Losant provides a number of [Handlebars Helpers](/dashboards/overview/#templating) which make it easy to build quite complex templates, and the popups have support for markdown link and image syntax.

Inside either the icon or popup templates, there are a number of variables available for you to use:

*   `isFirstPoint` - True if this is the first (oldest) data point in the series.
*   `isLastPoint` - True if this is the last (most recent) data point in the series.
*   `index` - Index of the current data point in the series.
*   `deviceName` - Name of the device that generated this data point.
*   `deviceId` - Id of the device that generated this data point.
*   `latitude` - Latitude of the current data point.
*   `longitude` - Longitude of the current data point.
*   `time` - Time of the current data point.
*   `data.<attributeName>` - Value of given attribute at this data point.
