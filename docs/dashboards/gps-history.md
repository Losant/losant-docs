# GPS History

The GPS History block shows the path of GPS datapoints across one or more devices. The map visualizes the historical path of each device as a connected line, with a start and end bubble.

![GPS History Dashboard](/images/dashboards/gps-history-example.png "GPS History Dashboard")

The map will automatically pan and zoom to display all the available data retrieved for the block's configuration. However, you are free to pan and zoom the map on your own.

## Configuration

At least one device ID or tag must be specified, along with a duration.

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

### Default Viewport

![GPS History Default Viewport](/images/dashboards/gps-viewport.png "GPS History Default Viewport")

Optionally, you may set a specific map center and/or zoom level for your map when it first loads. Failing to set a center, or setting "Automatic" for the zoom level, will cause the map to automatically set those aspects of its viewport to fit the data being passed to the map. Note that once a user manually pans or zooms the map, the default center and zoom will be ignored until the page is reloaded.

### Map Style

![GPS History Map Style](/images/dashboards/map-style.png "GPS History Map Style")

Optionally, you may choose a particular map style. The two current styles available are `Normal` and `Satellite`. Normal is a standard vector map with streets and labels, and will change from a light to a dark style depending on the theme chosen for viewing the dashboard. Satellite uses satellite imagery to display the map with streets and labels overlaid on top - the satellite style does not have themes for light or dark, and will remain the same no matter what theme is chosen for the dashboard.

### Point Display Configuration

![Point Display Configuration](/images/dashboards/gps-history-point-config.png "Point Display Configuration")

The history block optionally allows [string templates](/workflows/accessing-payload-data/#string-templates) of the icons and popups for the various points being displayed. By default, the templates place a red marker at the oldest (starting) point and a green marker at the newest (current) point, and clicking either will display a popup with the time and coordinates for that point.

When using a string template for an icon, the template must resolve to a single URL pointing to an image with a size of **30px wide by 70 tall** – or larger, so long as the ratio is the same. (The center of the image is centered over the point). String templates in popups can also be wrapped in [Markdown](http://commonmark.org/help/), allowing for formatting options such as **bold** and *italic*. Using Losant's built-in [Handlebars helpers](/workflows/accessing-payload-data/#string-templates), it is possible to build quite complex templates image and icon string templates.

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
