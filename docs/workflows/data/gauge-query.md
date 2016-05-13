# Gauge Query Node

The gauge query node allows a workflow to query and aggregate state data for one or more devices for a specific attribute.

![Gauge Query Node](/images/workflows/data/gauge-query-node.png "Gauge Query Node")

## Configuration

The configuration for the gauge query node is extremely similar to the [gauge dashboard block](/dashboards/gauge/).

![Gauge Query Node Device Selection](/images/workflows/data/gauge-query-node-device.png "Gauge Query Node Device Selection")

First step is selecting the devices to query.  The node has two options for selecting devices - you can specifically select a set of devices to query, or you can pull one or more device ids off of the current workflow payload to query.  That second option allows a workflow to dynamically change what specific devices are being queried depending on the payload currently being processed.  In the example above, the first option is being used, and the node will query all devices whose tag `floor` is equal to `2`.

![Gauge Query Node Config](/images/workflows/data/gauge-query-node-config.png "Gauge Query Node Config")

The gauge node also needs to know the time frame, the attribute, and what aggregation to use for the query.  When querying only a single device, and requesting only the last data point, no aggregation is needed (since there will only be a single value).  In the above example, the attribute `current` will be averaged over the last 24 hours for the selected devices.

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
