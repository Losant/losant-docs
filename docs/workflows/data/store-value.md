# Storage: Set Value Node

The storage set value node allows a workflow to store or manipulate a value for use in a subsequent workflow run by the [storage get value node](/workflows/data/get-value/). Stored values can also be viewed and manipulated using the [workflow storage tab](/workflows/overview/#workflow-storage). The maximum size of a value stored
by a storage set value node is 16KB.

![Storage Set Value Node](/images/workflows/data/storage-set-value-node.png "Storage Set Value Node")

## Configuration

There are three configuration properties for the storage set value node - an identifier, an operation, and the value for that operation. The identifier is how the workflow identifies the value being stored. This identifier is a [string template](/workflows/accessing-payload-data/#string-templates), and becomes the key under which the value is stored. Subsequent [storage get value nodes](/workflows/data/get-value/) can use this identifer to access this value in other runs of the workflow.

![Storage Set Value Node Configuration](/images/workflows/data/storage-set-value-node-config.png "Storage Set Value Node Configuration")

The operation is what to actually do against that identifer. There are seven possible operations:

* **Store Value From Payload Path**: This will treat the value field as a [payload path](/workflows/accessing-payload-data/#payload-paths), and will store whatever the current value is at that path on the payload.
* **Store String**: This will treat the value field as a [string template](/workflows/accessing-payload-data/#string-templates), and store the result of that template.
* **Store JSON**: This will treat the value field as a [JSON template](/workflows/accessing-payload-data/#json-templates), and store the resulting object.
* **Store Number**: This will also treat the value field as a [string template](/workflows/accessing-payload-data/#string-templates), except the result will be cast to a number before being stored. If the result cannot be cast to a number, the node will error.
* **Increment Value**: This allows the node to atomically increment a value already in storage. The value in storage must either be a number or not exist (in which case it is treated as 0). If the value in storage is not a number, the node will error. The value field is treated as the amount by which to increment - it is a [string template](/workflows/accessing-payload-data/#string-templates) whose result is cast to a number. If the value cannot be cast to a number, the node will error. Floating point and negative increments are allowed.
* **Decrement Value**: This allows the node to atomically decrement a value already in storage. The value in storage must either be a number or not exist (in which case it is treated as 0). If the value in storage is not a number, the node will error.  The value field is treated as the amount by which to increment - it is a [string template](/workflows/accessing-payload-data/#string-templates) whose result is cast to a number. If the value cannot be cast to a number, the node will error. Floating point and negative increments are allowed.
* **Clear Value**: This clears out whatever value was currently stored.

In the above example, the workflow is using the `tore Value From Payload Path` operation. This means the workflow will grab the value in the current payload at `data.color` and store that under the identifier `storedColor`. That value would then be accessible in future workflow runs using a [storage get value node](/workflows/data/get-value/) configured with the identifier `storedColor`.

![Storage Set Value Node Result](/images/workflows/data/storage-set-value-node-result.png "Storage Set Value Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the result of the storage operation can be placed at that path on the current workflow payload. In the case of increment and decrement operations, the value placed on the payload will be the storage value after the increment/decrement is applied. In the case of clearing the stored value, the result will be whatever the stored value previously was. For the other operations, the result will just be the value that was stored.