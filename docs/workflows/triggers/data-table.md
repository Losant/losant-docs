flowclass: Cloud
description: Learn more about the Losant Data Table Trigger.

# Data Table Trigger

The Data Table Trigger will fire a workflow whenever a rows are manipulated in the selected data table.

![Data Table Trigger](/images/workflows/triggers/data-table-trigger.png "Data Table Trigger")

## Configuration

There are two configurable criteria for a Data Table Trigger: the data table to watch, and the types of actions to trigger on. You can choose to trigger on any combination of inserting rows, updating rows, and deleting rows.

![Data Table Trigger Config](/images/workflows/triggers/data-table-trigger-config.png "Data Table Trigger Config")

In the above example, the workflow will be triggered whenever a row is added or removed from the "My User Info" data table.

## Payload

Depending on the action, the data provided to the workflow changes. On an insertion trigger, the newly inserted row will be provided. On a bulk insert trigger, ids of the successfully inserted rows will be provided (not the entire set of rows). On an update trigger, both the row prior to the update and the row after the update will be provided. On a deletion trigger, the deleted row will be provided.

```json
{
  "time": <time of the data table action>,
  "data": {
    "action": <action type - "insert" / "bulkInsert" / "update" / "remove">,
    "newRow": <the current row object, for insert and update actions>
    "oldRow": <the original row object, for delete and update actions>,
    "count": <for bulkInsert, the count of rows inserted>,
    "errorCount": <for bulkInsert, the count of insertions that failed>,
    "rowIds": <for bulkInsert, an array of the ids of the inserted rows>
  },
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the workflow trigger>,
  "triggerType": "dataTable",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "action": "insert",
    "newRow": {
      "id":        "66c794a06895b00100cbe84c",
      "createdAt": Fri Feb 20 2017 13:23:00 GMT-0500 (EST),
      "updatedAt": Fri Feb 20 2017 13:23:00 GMT-0500 (EST),
      "name":      "A Name",
      "phone":     "867-5309",
    }
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "ExampleApp",
  "triggerId": "5983c39535af7d000713425a",
  "triggerType": "dataTable",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "User Add/Remove Response",
  "globals": {}
}
```
