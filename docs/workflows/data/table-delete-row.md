# Table: Delete Row Node

The Data Table Delete Row node allows a workflow to delete an existing row from a  [Data Table](/data-tables/overview/) inside the current application.

![Table Delete Row Node](/images/workflows/data/table-delete-row-node.png "Table Delete Row Node")

## Configuration

The node has three configuration properties - the data table from which to delete the row, the ID of the row to delete, and a payload path for storing the result of the deletion.

![Table Delete Row Node Config](/images/workflows/data/table-delete-row-node-config.png "Table Delete Row Node Config")

The row ID field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a row based on the current workflow payload. The example above is doing exactly that, and is referencing the field `data.body.rowId` on the workflow payload.

Optionally, the node also takes a [payload path](/workflows/accessing-payload-data/#payload-paths) to store the result of the row deletion. When a payload path is provided either `true` or an error object will be placed at that path by the node. If the node successfully found and deleted a row, `true` will be placed at the payload path, otherwise the value will be an error object. In the example above, this value will be placed at `data.deletionResult`.