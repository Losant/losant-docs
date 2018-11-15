flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Data: Gauge Query Node.

# Data: Gauge Query Node

The Data: Gauge Query Node allows a workflow to retrieve and aggregate recent state data for a specific attribute across devices.

![Gauge Query Node](/images/workflows/data/gauge-query-node.png "Gauge Query Node")

## Configuration

The configuration for the Data: Gauge Query Node is extremely similar to the [Gauge Dashboard Block](/dashboards/gauge/).

![Gauge Query Node Device Selection](/images/workflows/data/gauge-query-node-device.png "Gauge Query Node Device Selection")

The first step is selecting the devices to query. The Data: Gauge Query Node has two options for selecting devices:

1. You can specifically select a set of devices to query.
1. You can define a [payload path](/workflows/accessing-payload-data/#payload-paths) to pull one or more Device IDs off of the current workflow payload to query.

In the example above, the first option is being used, and the node will query all devices whose tag `floor` is equal to `2`.

The second option allows a workflow to dynamically change what specific devices are being queried depending on the payload currently being processed.

![Gauge Query Node Config](/images/workflows/data/gauge-query-node-config.png "Gauge Query Node Config")

The Data: Gauge Query Node also needs to know the time range, the attribute, and what aggregation to use for the query. When querying a single device, and requesting only the last data point, no aggregation is needed (since there will only be a single value). In the above example, the attribute `current` will be averaged over the last 24 hours for the selected devices.

![Gauge Query Node Result](/images/workflows/data/gauge-query-node-result.png "Gauge Query Node Result")

Once the query is configured, the node needs a [payload path](/workflows/accessing-payload-data/#payload-paths) to know where to store the result on the current workflow payload. The value placed at that path is an object with two properties:

1. `value` - the value from the query.  
1. `time` - the time value for the queried value.

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "value": 7.175925925925926
}
```

The time field is most useful when using the node to query the "Last received data point" for an attribute, as the time value will be the time of that data point.

In the above example, the result will be stored at `data.currentAvg`. The payload after the execution of the example Data: Gauge Query Node above would look like:

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
  "applicationName": "Embree",
  "triggerId": "56c794a06895b00100cbe84c",
  "triggerType": "timer",
  "flowId": "56c794a06895b00100cbe84c",
  "flowName": "Query Data"
}
```
