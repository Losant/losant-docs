flowclass: Application
flowclass: Experience
description: Learn more about the Losant Data: Time Series Node.

# Data: Time Series Node

The Data: Time Series Node allows a workflow to query recent state across a time period for one or more devices for a specific attribute.

![Time Series Node](/images/workflows/data/time-series-node.png "Time Series Node")

## Configuration

The configuration for the node is extremely similar to the [Time Series Dashboard Block](/dashboards/time-series-graph/).

![Time Series Node Device Selection](/images/workflows/data/time-series-node-device.png "Time Series Node Device Selection")

The first step is selecting the devices to query. The node has two options for selecting devices:

1. You can specifically select a set of devices to query.
1. You can define a [payload path](/workflows/accessing-payload-data/#payload-paths) to pull one or more Device IDs off of the current workflow payload to query.

In the example above, the first option is being used, and the node will query all devices whose tag `floor` is equal to `2`.

The second option allows a workflow to dynamically change what specific devices are being queried depending on the payload currently being processed.

![Time Series Node Config](/images/workflows/data/time-series-node-config.png "Time Series Node Config")

The Data: Time Series Node also needs to know the attribute, the time range, the resolution, and what aggregation to use for the query. The available resolutions will vary depending on the selected time range, just like the Time Series Dashboard Block. In the above example, the attribute `kwattHours` will be queried over the last 24 hours with a one-hour resolution using a `SUM` aggregation.

![Time Series Node Result](/images/workflows/data/time-series-node-result.png "Time Series Node Result")

Once the query is configured, the node needs a [payload path](/workflows/accessing-payload-data/#payload-paths) to know where to store the result on the current workflow payload. The value placed at that path will be an array of points:

```json
[
    { "time": Thurs Feb 18 2016 18:00:00 GMT-0500 (EST), "value": 48.8 },
    { "time": Thurs Feb 18 2016 19:00:00 GMT-0500 (EST), "value": 49.7 },
    { "time": Thurs Feb 18 2016 20:00:00 GMT-0500 (EST), "value": 51.0 },
    { "time": Thurs Feb 18 2016 21:00:00 GMT-0500 (EST), "value": 51.7 },
    { "time": Thurs Feb 18 2016 22:00:00 GMT-0500 (EST), "value": 50.2 },
    { "time": Thurs Feb 18 2016 23:00:00 GMT-0500 (EST), "value": 50.6 },
    { "time": Fri Feb 19 2016 00:00:00 GMT-0500 (EST),   "value": 50.9 },
    { "time": Fri Feb 19 2016 01:00:00 GMT-0500 (EST),   "value": 49.1 },
    { "time": Fri Feb 19 2016 02:00:00 GMT-0500 (EST),   "value": 49.2 },
    { "time": Fri Feb 19 2016 03:00:00 GMT-0500 (EST),   "value": 49.1 },
    { "time": Fri Feb 19 2016 04:00:00 GMT-0500 (EST),   "value": 58.1 },
    { "time": Fri Feb 19 2016 05:00:00 GMT-0500 (EST),   "value": 57.8 },
    { "time": Fri Feb 19 2016 06:00:00 GMT-0500 (EST),   "value": 49.7 },
    { "time": Fri Feb 19 2016 07:00:00 GMT-0500 (EST),   "value": 54.2 },
    { "time": Fri Feb 19 2016 08:00:00 GMT-0500 (EST),   "value": 54.2 },
    { "time": Fri Feb 19 2016 09:00:00 GMT-0500 (EST),   "value": 53.6 },
    { "time": Fri Feb 19 2016 10:00:00 GMT-0500 (EST),   "value": 57.8 },
    { "time": Fri Feb 19 2016 11:00:00 GMT-0500 (EST),   "value": 53.2 },
    { "time": Fri Feb 19 2016 12:00:00 GMT-0500 (EST),   "value": 55.6 },
    { "time": Fri Feb 19 2016 13:00:00 GMT-0500 (EST),   "value": 55.5 },
    { "time": Fri Feb 19 2016 14:00:00 GMT-0500 (EST),   "value": 55.6 },
    { "time": Fri Feb 19 2016 15:00:00 GMT-0500 (EST),   "value": 54.2 },
    { "time": Fri Feb 19 2016 16:00:00 GMT-0500 (EST),   "value": 52.4 },
    { "time": Fri Feb 19 2016 17:00:00 GMT-0500 (EST),   "value": 32.2 }
]
```

The array of points will be in order from oldest timestamp to newest. Each point is an object with two properties:

1. `value` - the value for that point
1. `time` - the timestamp of that point.

In the above example, the result will be stored at `data.totalKwattHours`. The payload after the execution of the example Data: Time Series Node above might look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "totalKwattHours": [
      { "time": Thurs Feb 18 2016 18:00:00 GMT-0500 (EST), "value": 48.8 },
      { "time": Thurs Feb 18 2016 19:00:00 GMT-0500 (EST), "value": 49.7 },
      { "time": Thurs Feb 18 2016 20:00:00 GMT-0500 (EST), "value": 51.0 },
      { "time": Thurs Feb 18 2016 21:00:00 GMT-0500 (EST), "value": 51.7 },
      { "time": Thurs Feb 18 2016 22:00:00 GMT-0500 (EST), "value": 50.2 },
      { "time": Thurs Feb 18 2016 23:00:00 GMT-0500 (EST), "value": 50.6 },
      { "time": Fri Feb 19 2016 00:00:00 GMT-0500 (EST),   "value": 50.9 },
      { "time": Fri Feb 19 2016 01:00:00 GMT-0500 (EST),   "value": 49.1 },
      { "time": Fri Feb 19 2016 02:00:00 GMT-0500 (EST),   "value": 49.2 },
      { "time": Fri Feb 19 2016 03:00:00 GMT-0500 (EST),   "value": 49.1 },
      { "time": Fri Feb 19 2016 04:00:00 GMT-0500 (EST),   "value": 58.1 },
      { "time": Fri Feb 19 2016 05:00:00 GMT-0500 (EST),   "value": 57.8 },
      { "time": Fri Feb 19 2016 06:00:00 GMT-0500 (EST),   "value": 49.7 },
      { "time": Fri Feb 19 2016 07:00:00 GMT-0500 (EST),   "value": 54.2 },
      { "time": Fri Feb 19 2016 08:00:00 GMT-0500 (EST),   "value": 54.2 },
      { "time": Fri Feb 19 2016 09:00:00 GMT-0500 (EST),   "value": 53.6 },
      { "time": Fri Feb 19 2016 10:00:00 GMT-0500 (EST),   "value": 57.8 },
      { "time": Fri Feb 19 2016 11:00:00 GMT-0500 (EST),   "value": 53.2 },
      { "time": Fri Feb 19 2016 12:00:00 GMT-0500 (EST),   "value": 55.6 },
      { "time": Fri Feb 19 2016 13:00:00 GMT-0500 (EST),   "value": 55.5 },
      { "time": Fri Feb 19 2016 14:00:00 GMT-0500 (EST),   "value": 55.6 },
      { "time": Fri Feb 19 2016 15:00:00 GMT-0500 (EST),   "value": 54.2 },
      { "time": Fri Feb 19 2016 16:00:00 GMT-0500 (EST),   "value": 52.4 },
      { "time": Fri Feb 19 2016 17:00:00 GMT-0500 (EST),   "value": 32.2 }
    ]
  },
  "globals": { },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "timer",
  "flowId": "56c794a06895b00100cbe84c",
  "flowName": "Query Data",
}
```
