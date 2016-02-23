# Store Value Node

The store value node allows a workflow to store a value for retrieval and use in a subsequent workflow run by the [get value node](/workflows/data/get-value/).

![Store Value Node](/images/workflows/data/store-value-node.png "Store Value Node")

## Configuration

There are two configuration properties for the store value node - an identifier and a payload path. The identifier is how the workflow identifies the value being stored.  This identifier is what should be used in subsequent [get value node](/workflows/data/get-value/) nodes that want to load this value in other runs of the workflow.  The payload path is a JSON path which defines where the workflow should pull the value to store from the current payload.  If the payload path does not actually exist in the current payload, the stored value (if there is one) is deleted.

![Store Value Node Example](/images/workflows/data/store-value-node-example.png "Store Value Node Example")

In the above example, the workflow will grab the value in the current payload at `data.color` and store that under the identifier `storedColor`.  That value would then be accessible in future workflow runs using a [get value node](/workflows/data/get-value/) configured with the identifier `storedColor`.
