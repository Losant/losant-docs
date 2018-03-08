flowclass: Edge 1.0.0
description: Learn more about the Losant Write: Read Node.

# File: Write

The File: Write Node allows you to write to a file on your [Edge Compute device](/devices/edge-compute/). This node is only available in [edge workflows](/workflows/edge-workflows/).

![File Write Node](/images/workflows/data/file-write-node.png "File Write Node")

## Configuration

There are a number of configuration options for this node:

*   **File Path:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the disk location of where to write the file.
*   **Encoding:** The content encoding (defaults to UTF8).
*   **File Content:** A string template for the content to write to the file.
*   **Result Path:** A [payload path](/workflows/accessing-payload-data/#payload-paths) for where to store the result of the operation, if desired.

![File Write Node Configuration](/images/workflows/data/file-write-node-configuration.png "File Write Node Configuration")

### If File Exists

If a file does not already exist at the file path defined in your configuration, the node will write a new file to disk at that path.

There are three options for what to do if a file does exist at the specified file path:

1. `Cancel and return an error if the file exists` - This will prevent the File: Write Node from overwriting an existing file.
2. `Append my content to the file if it exists` - The content be added to the end of the file. All the content currently in the file will remain.
3. `Overwrite the file with my new content if it exists` - (Default) The file at this location will be replaced with the new file content.

## Result

The result path is optional; if it is set, the result of the write operation will be placed at the payload path specified.

For example, If the result path is set to `data.result`, and the write was successful, the result will look like the following:

```json
{
  "data": {
    "result": {
      "value": true
    }
  }
}
```

If the write was unsuccessful then the output would look like the following:

```json
{
  "data": {
    "result": {
      "value": false,
      "error": {
        "type": "FILE_WRITE_ERROR",
        "message": "A message describing the issue."
      }
    }
  }
}
```
