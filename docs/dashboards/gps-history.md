# GPS History

The GPS History block shows the path of GPS data points across one or more devices. The map visualizes the historical path of each device as a connected line, with a start and end bubble.

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

* **Device IDS / Tags** is a [device query](/devices/device-queries/) for choosing which devices are displayed on the map.
* **Attribute** is the device attribute that contains the location data. The attribute must be of type [GPS string](/devices/state/#gps-attributes), and any attribute reported by the selected devices that is not of the [GPS string](/devices/state/#gps-attributes) type will not be available to choose. If displaying multiple devices on the map via tags or multiple IDs, each device must provide the same attribute name.

### Default Viewport

![GPS History Default Viewport](/images/dashboards/gps-viewport.png "GPS History Default Viewport")

Set the default viewport for the block. You can also interact with the map in the block preview and pass its settings to the block configuration by clicking the "Set" button.

* **Center:** Automatically center the map to the middle of the points returned by the query, or set a manual position for the chart's center either as a context variable or in a `lat,lng` format.
* **Zoom:** Automatically zoom the map to display all points returned by the query, or set a manual zoom level.
* **Bearing:** Set a default bearing, where `0` points north to the top of the map, and values between `-180` and `180` swing the map in either direction.
* **Pitch:** Set a default pitch for the map, between `0` (straight overhead) and `60` degrees.

Once a user manually pans or zooms the chart in the dashboard view, the default settings are disregarded until the dashboard is reloaded.

### Map Style

![GPS History Map Style](/images/dashboards/history-map-style.png "GPS History Map Style")

Optionally, you may choose a particular map tile set. The two current styles available are `Normal` and `Satellite`. Normal is a standard vector map with streets and labels, and will change from a light to a dark style depending on the theme chosen for viewing the dashboard. Satellite uses satellite imagery to display the map with streets and labels overlaid on top - the satellite style does not have themes for light or dark, and will remain the same no matter what theme is chosen for the dashboard.

You may also include arrows on your history lines to show the direction of movement between your GPS points.

### State Property Behavior

By default, other state attributes available in the [advanced pin style](#advanced-pin-style-configuration) and [popup configuration](#popup-style-configuration) return the most recently received value for that attribute at the time of any GPS point. However, you may change this behavior to only provide state attributes that were reported at the same time as the GPS state report. In this case, other attributes that were not reported along with the GPS data will return `undefined`.

### Point Display Configuration

Losant allows for customization of the pins for points on the map as well as the popups that appear when clicking on a map pin.

#### Line Decorators
By default, Losant draws lines between data points on the map. You can remove these lines so that only the raw data points will be displayted.
![Point Display Configuration](/images/dashboards/gps-history-point-display-configuration.png "Point Display Configuration")
#### Arrow Decorators
Optionally, if line decorators are enabled, you can enable arrow decorators to show which direction your connected device was moving along the line.


#### Simple Pin Style Configuration

![Simple Pin Style Configuration](/images/dashboards/gps-history-simple-pin-config.png "Simple Pin Style Configuration")

By default, Losant places a red marker at the oldest (starting) point for a series and a green marker at the most recent
(ending) point for a series. You can change the color of either pin using the color picker for that pin, and the change
will apply to all of the relevant start or end pins on the map.

#### Advanced Pin Style Configuration

![Advanced Pin Style Configuration](/images/dashboards/gps-history-advanced-pin-config.png "Advanced Pin Style Configuration")

If you want more control over marker pins, you can select `Advanced`. This allows you to provide a [string templates](/workflows/accessing-payload-data/#string-templates)
that will be rendered for each individual point in each series displayed on the map. The string template must resolve to a single URL pointing to an image with a size of
**30px wide by 70 tall** – or larger, so long as the ratio is the same. If the template does not resolves to a blank string for a point, no marker will be displayed for
that point. Losant provides a helper function `colorMarker` which can be used to create the same kinds of markers that the `simple` configuration uses - the function takes
a single argument, which is a hex color string, and returns an image url for a marker of that color. The default template for the advanced section uses this helper, rendering
a red marker for the starting (oldest) point of a series, and a green marker for the ending (most recent) point of a series.

When using the advanced mode, the following variables are available for you to use in the icon template:

* `isFirstPoint` - True if this is the first (oldest) data point in the series.
* `isLastPoint` - True if this is the last (most recent) data point in the series.
* `index` - Index of the current data point in the series.
* `deviceName` - Name of the device that generated this data point.
* `deviceId` - Id of the device that generated this data point.
* `deviceTags` - The tags (as an object) of the device that generated this data point.
* `latitude` - Latitude of the current data point.
* `longitude` - Longitude of the current data point.
* `time` - Time of the current data point.
* `data.<attributeName>` - Value of given attribute at this data point.

### Popup Style Configuration

![Popup Style Configuration](/images/dashboards/gps-history-popup-config.png "Popup Style Configuration")

Just like the `Advanced` pin configuration, the popup configuration allows you to provide a [string templates](/workflows/accessing-payload-data/#string-templates) that will
be used for rendering the popup for a point. The popup for a point will only be available if there is a pin for that point, so make sure that a pin is rendered for any points
that you want to provide a popup for. String templates for popups are treated as [Markdown](http://commonmark.org/help/), allowing for formatting options such as **bold** and
*italic*. Using Losant's built-in [Handlebars helpers](/workflows/accessing-payload-data/#string-templates), it is possible to build quite complex popup templates that include
images and links. By default the popup template renders simple text with the device name, timestamp of the point, and lat/lng location of the point. If the template renders to
an empty string for a point, no popup will appear when clicking the map pin for that point.

The same variables exposed in the [advanced pin style configuration](#advanced-pin-style-configuration) are available in the popup configuration.
