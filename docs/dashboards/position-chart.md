# Position Chart

The Position Chart allows for displaying the position of devices over a custom image, such as a floorplan. The block behaves similarly to the [GPS History Block](/dashboards/gps-history/) with the exception of the custom image in place of the world map.

![Position Chart Block](/images/dashboards/position-chart-overview.png "Position Chart Block")

## Configuration

The Position Chart configuration can be broken down into a number of sections.

### Duration

Select the duration of data you would like to display for the devices on the chart. You may select time ranges between `Last received data point` and `90 days`. If choosing a duration other than `Last received data point`, the data for each device will be represented by a colored line on the chart.

### Block Data

Select the device(s) and attributes for which you would like to display position data.

![Position Chart Block Data](/images/dashboards/position-chart-block-data.png "Position Chart Block Data")

* **Device IDs / Tags:** A [device query](/devices/device-queries/) for which you would like to return data. Each device that matches the query will be represented separately on the Position Chart.
* **X Attribute:** The attribute on the selected device(s) that corresponds to the `x` position on the chart. This attribute must be a of the ["Number" type](/devices/state/#state-attributes), or a [context variable](/dashboards/context-variables/) that resolves to a Number attribute.
* **Y Attribute:** Similar to the X Attribute, except this represents the `y` position on the chart.

### Image

Choose the image atop which you would like to display position data. Enter an absolute URL to an image that is hosted on the service of your choosing.

The URL must resolve to an image; if it does not, the block will display an error message and position data will not be displayed within the block.

![Position Chart Image and Reference Pins](/images/dashboards/position-chart-image-reference-pins.png "Position Chart Image and Reference Pins")

### Reference Pins

Once an image has been chosen, it is necessary to set a frame of reference for how to scale and position your device data over the image. By setting two reference pins, we are able to convert your `(x, y)` position data into pixel positions on your image regardless of your data plane's scale or orientation.

For each reference pin, you may click and drag the pin to a spot on the image or you may manually enter a pixel position in the format `x,y`, where the top left corner is position `0,0` and the bottom right is the image's `width,height`.

Then, you must then enter the `x,y` coordinate that corresponds to that spot within your plane. Changing these values, or the position of the reference pins, will cause your position data to reorient.

### Viewport

Set the default viewport for the block. You can also interact with the chart in the block preview and pass its settings to the block configuration by clicking the "Set" button.

![Position Chart Viewport](/images/dashboards/position-chart-viewport.png "Position Chart Viewport")

* **Center:** Automatically center the chart to the middle of the points returned by the query, or set a manual position for the chart's center either as a context variable or in an `x,y` format.
* **Zoom:** Automatically zoom the chart to display all points returned by the query, or set a manual zoom level. A zoom of `0` displays the image at its natural size.

Once a user manually pans or zooms the chart in the dashboard view, the default settings are disregarded until the dashboard is reloaded.

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
(ending) point for a series. You can change the color and the transparency of either pin using the color picker for that pin, and the change
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
* `x` - The x position of the current data point.
* `y` - The y position of the current data point.
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
