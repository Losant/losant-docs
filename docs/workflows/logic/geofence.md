# Geofence Node

The geofence node allows a workflow to branch based upon the distance between two coordinates.

![Geofence Node](/images/workflows/logic/geofence-node.png "Geofence Node")

## Configuration

The geofence node has 4 distinct configuration sections - the coordinates to check (the "input" coordinates), the center point coordinates, the center point radius, and an optional [payload path](/workflows/accessing-payload-data/#payload-paths) for the calculated distance.

When the geofence node runs, it calculates the distance between the input and center point coordinates, and if that distance is less than or equal to the defined center point radius, the `true` route on the right out of the node is taken. If that distance is greater than the center point radius, the `false` route on the left out of the node is taken. If the distance between the two points cannot be calculated for some reason, the `false` route on the left out of the node is taken.

![Geofence Node Example](/images/workflows/logic/geofence-node-example.png "Geofence Node Example")

In the above example, there are actually two different geofences. The first checks against a center point position that represents "Home". If that is true (the route to the right), it records that payload as being "At Home". If that is false (the route to the left), it moves on to the second geofence, which checks against a center point position that represents "Work". If that is true (the route to the right), it records that payload as being "At Work", but if that is false (the route to the left), it records that payload as being "Other".

### Input Coordinate Configuration

![Geofence Node Input Config](/images/workflows/logic/geofence-node-input-config.png "Geofence Node Input Config")

The input coordinates can be defined three different ways:

*   [Decimal Degrees](https://en.wikipedia.org/wiki/Decimal_degrees)<br/>
    Example: `37.33233141,-122.0312186`

*   [Degrees Minutes Seconds](https://en.wikipedia.org/wiki/Degree_(angle)#Subdivisions) (also known as Sexagesimal)<br/>
    Example: `37°19'56.39"N,122°1'52.38"W`

*   [NMEA GLL](http://www.gpsinformation.org/dale/nmea.htm#GLL)<br/>
    Example: `$GPGLL,3906.71226,N,8430.74572,W,000653,A,*24`

*   [NMEA GGA](http://www.gpsinformation.org/dale/nmea.htm#GGA)<br/>
    Example: `$GPGLL,3719.940,N,12201.873,S,225444,A,*1C`

No matter which type is selected, the field will also accept a [string template](/workflows/accessing-payload-data/#string-templates) for the value. In the above example, the input coordinates are defined as the `data.location` field of the payload, which contains an NMEA string.

### Center Point Coordinate Configuration

![Geofence Node Center Config](/images/workflows/logic/geofence-node-center-config.png "Geofence Node Center Config")

The center point coordinates can be defined the same was as the input coordinates, in any one of the five formats described above. While in the common case, the center point coordinate values will be static, these fields also support [string templates](/workflows/accessing-payload-data/#string-templates) in case a dynamic center point is needed. Because the common case is a static center point, a map visualization is displayed to help show the real world location of the geofence. In the above example, the center point coordinates are defined statically using decimal degrees.

### Radius Configuration

![Geofence Node Radius Config](/images/workflows/logic/geofence-node-radius-config.png "Geofence Node Radius Config")

The radius of the center point is defined in meters, and must be greater than 0. If the radius is defined as 0 meters, only an exact match between the center point and input point will count as being "within" the geofence. In the common case, the radius will be defined as a static value, but the field does support [string templates](/workflows/accessing-payload-data/#string-templates) in case the radius needs to be dynamically defined based upon the current payload. If the radius (and center point) are defined statically, the map visualization will show the extent of the real world location of the geofence. In the above example, the radius is defined as 50 meters, and the map shows what that actually covers in the physical world.

### Adding Distance or Branch to the Payload

![Geofence Node Distance Value](/images/workflows/logic/geofence-node-distance-value.png "Geofence Node Distance Value")

The geofence node has the ability to optionally add the calculated distance between the input and center point to the payload at a defined [payload path](/workflows/accessing-payload-data/#payload-paths). If a path is defined, the distance (in meters) will be placed at that path no matter which branch out of the geofence node is taken. If there is a problem calculating the distance (bad coordinates or radius), no value will be places at the path. In the above example, the distance between the input and center coordinates will be placed at the `data.distance.work` path.

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
