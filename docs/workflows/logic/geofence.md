flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant Geofence Node.

# Geofence Node

The Geofence Node allows a workflow to branch based upon whether a device reports state within a certain geographic area.

![Geofence Node](/images/workflows/logic/geofence-node.png "Geofence Node")

## Configuration

The Geofence Node has three different configruation settings: circular, polygonal, and polgyonal path. The geofence has 3 configuration sections - the coordinate to check (the "input" coordinate), the geofence coordinates to check against, and a branch output.

## Circular Geofence

When the Geofence Node runs, it calculates the distance between the input and center point coordinates, and if that distance is less than or equal to the defined center point radius, the `true` route on the right out of the node is taken. If that distance is greater than the center point radius, the `false` route on the left out of the node is taken. If the distance between the two points cannot be calculated for some reason, the `false` route on the left out of the node is taken.

![Geofence Node Example](/images/workflows/logic/geofence-node-workflow-example.png "Geofence Node Example")

In the above example, there are actually two different geofences. The first checks against a center point position that represents "Home". If that is `true` (the route to the right), it records that payload as being "At Home". If that is `false` (the route to the left), it moves on to the second geofence, which checks against a center point position that represents "Work". If that is `true` (the route to the right), it records that payload as being "At Work", but if that is `false` (the route to the left), it records that payload as being "Other".

### Input Coordinate Configuration

![Geofence Node Input Config](/images/workflows/logic/geofence-node-input-config.png "Geofence Node Input Config")

The input coordinates can be defined by any of the forms we support for [GPS device state](/devices/state/#gps-attributes). No matter which form is used, the field will also accept a [string template](/workflows/accessing-payload-data/#string-templates) for the value. In the above example, the input coordinates are defined as the `data.location` field of the payload, which contains an NMEA string.

### Center Point Coordinate Configuration

![Geofence Node Center Config](/images/workflows/logic/geofence-node-center-config.png "Geofence Node Center Config")

The center point coordinates can be defined the same was as the input coordinates, in any one of the forms we support for [GPS device state](/devices/state/#gps-attributes). While in the common case, the center point coordinate values will be static, these fields also support [string templates](/workflows/accessing-payload-data/#string-templates) in case a dynamic center point is needed. Because the common case is a static center point, a map visualization is displayed to help show the real world location of the geofence. In the above example, the center point coordinates are defined statically using decimal degrees.

### Radius Configuration

![Geofence Node Radius Config](/images/workflows/logic/geofence-node-radius-config.png "Geofence Node Radius Config")

The radius of the center point is defined in meters, and must be greater than 0. If the radius is defined as 0 meters, only an exact match between the center point and input point will count as being "within" the geofence. In the common case, the radius will be defined as a static value, but the field does support [string templates](/workflows/accessing-payload-data/#string-templates) in case the radius needs to be dynamically defined based upon the current payload. If the radius (and center point) are defined statically, the map visualization will show the extent of the real world location of the geofence. In the above example, the radius is defined as 50 meters, and the map shows what that actually covers in the physical world.

### Adding Distance or Branch to the Payload

![Geofence Node Distance Value](/images/workflows/logic/geofence-node-distance-value.png "Geofence Node Distance Value")

The Circular Geofence Node has the ability to optionally add the calculated distance between the input and center point to the payload at a defined [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the distance (in meters) will be placed at that path no matter which branch out of the Geofence Node is taken. If there is a problem calculating the distance (bad coordinates or radius), no value will be places at the path. In the above example, the distance between the input and center coordinates will be placed at the `data.distance.work` path.

The node also has the ability to optionally add which branch out of the node was taken to the payload. If a path is defined, `true` or `false` will be placed at the given path, depending on which branch out of the node is taken. In the above example, the branch taken will be placed at the `data.geobranch.work` path.

 So, for example, given the following payload:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "location": "$GPGLL,3906.72686,N,8430.74572,W,231131,A,*2a",
    "distance": {
      "home": 1654
    }
  },
  ...
}
```

The payload after execution of the geofence node would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "location": "$GPGLL,3906.72686,N,8430.74572,W,231131,A,*2a",
    "distance": {
      "home": 1654,
      "work": 34
    },
    "geobranch": {
      "home": false,
      "work": true
    }
  },
  ...
}
```

## Polygonal Geofence

The Polygonal Geofence calculates whether the input coordinate falls within a defined polygonal area. If the input coordinate falls within the defined area, the `true` path is taken. If it falls outside the defined area, the `false` path is taken. If whether or not the input falls within the polygon cannot be calculated for some reason, the `false` route on the left out of the node is taken.

The Polygonal Gefence mode lets users draw their own polygon using the map's drawing tool or by typing the coordinates into the text box below it.

To draw a polygon, click on the polygon tool in the top-right corner of the map and right-click where you'd like to begin to draw your polygon. To set the line and begin drawing in another direction, right-click on the map again. Do this until you have defined the area you with to monitor and then double-click to finish drawing. The coordinates you just drew will be displayed and editable in the text box below.

To delete a polygon, click inside of it and click the trash button in the top-right corner of the map or delete the coordinates in the textbox underneath the map.

Coordinates placed in the text box can be defined by any of the forms we support for [GPS device state](/devices/state/#gps-attributes).

![Geofence Node](/images/workflows/logic/geofence-node-drawn-polygon.png "Geofence Node")

## Polygonal Path

The Geofence Node also allows polygonal geofences to be passed in via an array of GPS Coordinates defined on a payload path. Note the order of the points in the array is important, as it determines how the polygon is drawn.