# Store Value Node

The store value node allows a workflow to store a value for retrieval and use in a subsequent workflow run by the [get value node](/workflows/data/get-value/).  Stored values can also be viewed and manipulated using the [workflow storage tab](/workflows/overview/#workflow-storage).

![Store Value Node](/images/workflows/data/store-value-node.png "Store Value Node")

## Configuration

There are two configuration properties for the store value node - an identifier and a source. The identifier is how the workflow identifies the value being stored.  This identifier is a [string template](/workflows/accessing-payload-data/#string-templates) the key under which the value is stored. It is here that subsequent [get value node](/workflows/data/get-value/) nodes can access this value in other runs of the workflow.

The source is the value to actually store, and can be defined as a [payload path](/workflows/accessing-payload-data/#payload-paths), [string template](/workflows/accessing-payload-data/#string-templates) or [JSON template](/workflows/accessing-payload-data/#json-templates). You may also choose to explicitly clear the value at the identifier by choosing "Empty".

![Store Value Node Example](/images/workflows/data/store-value-node-example.png "Store Value Node Example")

In the above example, the workflow will grab the value in the current payload at `data.color` and store that under the identifier `storedColor`.  That value would then be accessible in future workflow runs using a [get value node](/workflows/data/get-value/) configured with the identifier `storedColor`.
