---
flowclass:
  - Application
  - Experience
description: 'Learn more about the Losant Table: Delete Rows Node.'
---

# Table: Delete Rows Node

The Data Table: Delete Rows Node allows a workflow to delete one or more existing rows from a [Data Table](/data-tables/overview/) inside the current application.

![Table Delete Rows Node](/images/workflows/data/table-delete-rows-node.png "Table Delete Rows Node")

## Configuration

The node has three configuration sections - the data table from which to delete the rows, defining what rows to delete, and a payload path for storing the result of the deletion.

![Table Delete Rows Node Config](/images/workflows/data/table-delete-rows-node-config.png "Table Delete Rows Node Config")

There are four options for defining what rows to delete:

* **Match on row ID**: Allows deletion of a single row based on row ID. The row ID field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a row based on the current workflow payload. The example above is doing exactly that, and is referencing the field `data.body.rowId` on the workflow payload.
* **Match any of the following**: Allows [building a query](/data-tables/overview/#querying-table-data) where any rows that match **any** of the defined column conditions will be deleted.
* **Match all of the following**: Allows [building a query](/data-tables/overview/#querying-table-data) where rows that match **all** of the column conditions will be deleted.
* **Advanced**: Allows [building an advanced query](/data-tables/overview/#advanced-queries) using a [JSON template](/workflows/accessing-payload-data/#json-templates). Rows that match the query will be deleted.

Optionally, the node also takes a [payload path](/workflows/accessing-payload-data/#payload-paths) to store the result of the deletion. If the node successfully found and deleted rows, an object of the form `{ result: true, count: <count> }` will be placed at the payload path, where count is the number of rows deleted. If there was an error, the value at the payload path will be an error object. In the example above, this value will be placed at `data.deletionResult`.
