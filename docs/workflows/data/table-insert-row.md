# Table: Insert Row Node

The Data Table Insert Row node allows a workflow to insert a new rows into a [Data Table](/data-tables/overview/) inside the current application, and optionally add the newly created row to the current workflow payload.

![Table Insert Row Node](/images/workflows/data/table-insert-row-node.png "Table Insert Row Node")

## Configuration

There are three different ways to configure input data for the insert row node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the row to insert, while the third choice is the more common option for simple situations.

In all three cases, though, you start by choosing a [Data Table](/data-tables/overview/), which will determine where this row will be inserted, and also determines what columns are expected for the row.

![Table Insert Row Node Configuration](/images/workflows/data/table-insert-row-node-config.png "Table Insert Row Node Configuration")

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Data Table Row Insert/Update](/rest-api/schemas/#data-table-row-insertupdate) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Data Table Row Insert/Update](/rest-api/schemas/#data-table-row-insertupdate) schema. In both of these cases, this means it must be an object where the keys of the objects are the column names of the data table, and the value for each key is the value for that column in the new row.

For "Individual Fields", the most common method to use and the one shown in the example above, each column in the row can be filled in individually. Both the column name field and the value field are [string templates](/workflows/accessing-payload-data/#string-templates), allowing dynamic mapping of what columns are filled in. You can also choose to set the value for a column explicitly as `null`, by using the Null checkbox. What columns are required depends entirely on the configuration of the columns of the data table itself.

![Table Insert Row Node Result](/images/workflows/data/table-insert-row-node-result.png "Table Insert Row Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the inserted row can be placed at that path on the current workflow payload. In the case of a successful row insertion, this will be the row object, and in the case of a failed row insertion this will be an object of any errors about the insertion of the row.

For instance, given the example node configuration in the screenshots above, this is a possible result for a successful row insertion:

```json
{
  "data": {
    "body": {
      "newName": "Bob",
      "newPhone": "867-5309",
      ...
    },
    "insertResult": {
      "name": "Bob",
      "phone": "867-5309",
      "id": "598ddf39ae2e7b0007fb7bcf",
      "updatedAt": "2017-08-11T16:45:45.861Z",
      "createdAt": "2017-08-11T16:45:45.861Z"
    },
    ...
  },
  ...
}
```

And again, given the example above, this is a possible result for a failed row insertion where the phone number field is required to be unique by the data table, and the given phone number already exists in another row:

```json
{
  "data": {
    "body": {
      "newName": "Bob",
      "newPhone": "867-5309",
      ...
    },
    "insertResult": {
      "error": {
        "type": "AlreadyExists",
        "message": "Entry already exists"
      }
    },
    ...
  },
  ...
}
```