# Geofence Node

The geofence node allows a workflow to branch based upon the distance between two coordinates.

![Geofence Node](/images/workflows/logic/geofence-node.png "Geofence Node")

## Configuration

The geofence node has 4 distinct configuration sections - the coordinates to check (the "input" coordinates), the center point coordinates, the center point radius, and an optional payload destination for the calculated distance.

When the geofence node runs, it calculates the distance between the input and center point coordinates, and if that distance is less than or equal to the defined center point radius, the `true` route on the right out of the node is taken.  If that distance is greater than the center point radius, the `false` route on the left out of the node is taken.  If the distance between the two points cannot be calculated for some reason, the `false` route on the left out of the node is taken.

![Geofence Node Example](/images/workflows/logic/geofence-node-example.png "Geofence Node Example")

In the above example, there are actually two different geofences.  The first checks against a center point position that represents "Home".  If that is true (the route to the right), it records that payload as being "At Home".  If that is false (the route to the left), it moves on to the second geofence, which checks against a center point position that represents "Work".  If that is true (the route to the right), it records that payload as being "At Work", but if that is false (the route to the left), it records that payload as being "Other".

### Input Coordinate Configuration

![Geofence Node Input Config](/images/workflows/logic/geofence-node-input-config.png "Geofence Node Input Config")

The input coordinates can be defined two different ways - either as a GPS NMEA string (of the GGA or GLL types), or as longitude and latitude values.  In either case, payload templating is allowed, using the standard `{{ }}` syntax.  In the above example, the input coordinates are defined as a NMEA string in the `data.location` field of the payload.

### Center Point Coordinate Configuration

![Geofence Node Center Config](/images/workflows/logic/geofence-node-center-config.png "Geofence Node Center Config")

The center point coordinates can be defined the same was as the input coordinates - either as a GPS NMEA string (of the GGA or GLL types), or as longitude and latitude values.  While in the common case, the center point coordinate values will be static, these fields also support payload templating in case a dynamic center point is needed.  Because the common case is a static center point, a map visualization is displayed to help show the real world location of the geofence.  In the above example, the center point coordinates are defined statically using longitude and latitude values.

### Radius Configuration

![Geofence Node Radius Config](/images/workflows/logic/geofence-node-radius-config.png "Geofence Node Radius Config")

The radius of the center point is defined in meters, and must be greater than 0.  If the radius is defined as 0 meters, only an exact match between the center point and input point will count as being "within" the geofence.  In the common case, the radius will be defined as a static value, but the field does support payload templating in case the radius needs to be dynamically defined based upon the current payload.  If the radius (and center point) are defined statically, the map visualization will show the extent of the real world location of the geofence.  In the above example, the radius is defined as 50 meters, and the map shows what that actually covers in the physical world.

### Adding Distance to the Payload

![Geofence Node Distance Value](/images/workflows/logic/geofence-node-distance-value.png "Geofence Node Distance Value")

The geofence node has the ability to optionally add the calculated distance between the input and center point to the payload at an arbitrary JSON path. If a path is defined, the distance (in meters) will be placed at that path no matter which branch out of the geofence node is taken.  If there is a problem calculating the distance (bad coordinates or radius), no value will be places at the `distance` path.  In the above example, the distance between the input and center coordinates will be places at the `data.distance.work` path.  So, for example, given the following payload:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "location": "$GPGLL,3906.72686,N,8430.74572,W,231131,A,*2a",
    "distance": {
      "home": 1654
    }
  },
  "applicationId": "56919b1a9d206d0100c54152",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56956cd25a6f2f0100dc70d4"
}
```

The payload after execution of the geofence node would look like:

```JSON
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "location": "$GPGLL,3906.72686,N,8430.74572,W,231131,A,*2a",
    "distance": {
      "home": 1654,
      "work": 34
    }
  },
  "applicationId": "56919b1a9d206d0100c54152",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "deviceId",
  "flowId": "56956cd25a6f2f0100dc70d4"
}
```
