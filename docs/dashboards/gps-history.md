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

* **Device IDS / Tags** is a [device query](/devices/device-queries.md) for choosing which devices are displayed on the map.
* **Attribute** is the device attribute that contains the location data. The attribute must be of type `NMEA (GPS Format)`. If displaying multiple devices on the map via tags or multiple IDs, each device must provide the same attribute name, and each must be in the correct format.
