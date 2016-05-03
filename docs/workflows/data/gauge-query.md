# Gauge Query Node

The gauge query node allows a workflow to query and aggregate state data for one or more devices for a specific attribute.

![Gauge Query Node](/images/workflows/data/gauge-query-node.png "Gauge Query Node")

## Configuration

The configuration for the gauge query node is extremely similar to the [gauge dashboard block](/dashboards/gauge/).

![Gauge Query Node Configuration](/images/workflows/data/gauge-query-node-config.png "Gauge Query Node Configuration")

The gauge node needs to know what device(s) to query, over what time frame, on what attribute, and what aggregation to use.  When querying only a single device, and requesting only the last data point, no aggregation is needed (since there will only be a single value).  In the above example, the attribute `current` will be averaged over the last 24 hours for all devices with the tag key `floor` set to `2`.

![Gauge Query Node Result](/images/workflows/data/gauge-query-node-result.png "Gauge Query Node Result")

Once the query is configured, the node needs a payload path to know where to store the result on the current workflow payload.  In the above example, the result will be stored at `data.currentAvg`.  The value placed at that path is actually an object with two properties - `value`, which will hold the value from the query, and `time`, which will hold the time value for the queried value.  The time field is most useful when using the node to query the "Last received data point" for an attribute, as the time value will be the time of that data point.

The payload after the execution of the example gauge query node above would look like:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "currentAvg": {
      "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
      "value": 7.175925925925926
    }
  },
  "globals": { },
  "applicationId": "568beedeb436ab01007be53d",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "timer",
  "flowId": "56c794a06895b00100cbe84c"
}
```
