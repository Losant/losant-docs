# Store Value Node

The store value node allows a workflow to store a value for retrieval and use in a subsequent workflow run by the [get value node](/workflows/data/get-value/).

![Store Value Node](/images/workflows/data/store-value-node.png "Store Value Node")

## Configuration

There are two configuration properties for the store value node - an identifier and a source. The identifier is how the workflow identifies the value being stored.  This identifier is what should be used in subsequent [get value node](/workflows/data/get-value/) nodes that want to load this value in other runs of the workflow.  The source is the value to actually store, and can be one of a couple different options:

*   **Payload Path** is the most common, and the one displayed in the example below.  With this option, the source should be a JSON path defining where in the current payload the value to store will be. If the payload path does not actually exist in the current payload, the currently stored value (if there is one) will be deleted.
*   **Template** means the value will be evaluated as a standard templatable field, and the result will be the value to store.
*   **JSON** means the value will be treated as static JSON, and the resulting JSON parsed object will be what is stored.  Using this choice, you can set static complex objects as the value, or even just simple values like true or false.
*   **Empty** means the node will explicitly clear whatever value is currently stored.

![Store Value Node Example](/images/workflows/data/store-value-node-example.png "Store Value Node Example")

In the above example, the workflow will grab the value in the current payload at `data.color` and store that under the identifier `storedColor`.  That value would then be accessible in future workflow runs using a [get value node](/workflows/data/get-value/) configured with the identifier `storedColor`.
