# Table: Update Row Node

The Data Table Update Row node allows a workflow to update an existing row in a [Data Table](/data-tables/overview/) inside the current application, and optionally add the updated row to the current workflow payload.

![Table Update Row Node](/images/workflows/data/table-update-row-node.png "Table Update Row Node")

## Configuration

To find the row to update, the node requires both a data table to be selected, and the id of the row to update. Both fields are [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a row based on the current workflow payload. The example below is doing exactly that, and is referencing the field `data.body.rowId` on the workflow payload.

![Table Update Row Node Configuration](/images/workflows/data/table-update-row-node-config.png "Table Update Row Node Configuration")

There are three different ways to configure input data for the update row node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the row being updated, while the third choice is the more common option for simple situations.

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Data Table Row Insert/Update](/rest-api/schemas/#data-table-row-insertupdate) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Data Table Row Insert/Update](/rest-api/schemas/#data-table-row-insertupdate) schema. In both of these cases, this means it must be an object where the keys of the objects are the column names of the data table, and the value for each key is the value for that column in the new row. Columns that are not specified will retain their current values on the row.

![Table Update Row Node Individual Fields](/images/workflows/data/table-update-row-node-individual-fields.png "Table Update Row Node Individual Fields")

For "Individual Fields", the most common method to use and the one shown in the example above, the row is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). In this case, no columns are required - not doing anything with a column will just not update that column on the row. You can choose to set a value for a column, or to clear the value for a column. In the example above, the node is just setting a new value for the phone number column on the row and leaving the other columns alone.

![Table Update Row Node Result](/images/workflows/data/table-update-row-node-result.png "Table Update Row Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the updated row can be placed at that path on the current workflow payload. In the case of a successful row update operation, this will be the updated row object. In the case of a failed row update, this will be an object of the errors that occurred trying to update the row.

For instance, given the example node configuration in the screenshots above, this is a possible result for a successful row update:

```json
{
  "data": {
    "body": {
      "rowId": "598ddf39ae2e7b0007fb7bcf",
      "newPhone": "867-5309",
      ...
    },
    "updateResult": {
      "name": "Bob",
      "phone": "867-5309",
      "id": "598ddf39ae2e7b0007fb7bcf",
      "updatedAt": "2017-08-11T16:45:45.861Z",
      "createdAt": "2017-08-10T15:34:33.712Z"
    },
    ...
  },
  ...
}
```

And again, given the example above, this is a possible result for a failed row update where the given row ID did not exist:

```json
{
  "data": {
    "body": {
      "rowId": "598ddf39ae2e7b0007fb7bcf",
      "newPhone": "867-5309",
      ...
    },
    "updateResult": {
      "error": {
        "type": "NotFound",
        "message": "Data Table Row was not found"
      }
    },
    ...
  },
  ...
}
```