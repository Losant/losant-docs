flowclass: Edge 1.0.0
description: Learn more about the Losant File: Read Node.

# File: Read

The File: Read Node allows you to read a file from disk on your [Edge Compute device](/edge-compute/overview/). This node is only available in [edge workflows](/workflows/edge-workflows/).

![File Read Node](/images/workflows/data/file-read-node.png "File Read Node")

## Configuration

There are five configuration settings for this node:

* **File Path:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the disk location of the file to read.
* **Encoding:** The file encoding (defaults to UTF8).
* **Start Position:** A string template or integer for the byte at which to start reading. Not setting a value defaults to the start of the file. Passing a negative integer will start reading that many bytes from the end of the file.
* **Bytes to Read:** A string template or integer for the number of bytes to read. Not setting a value reads until the end of the file.
* **Result Path:** (Required) A [payload path](/workflows/accessing-payload-data/#payload-paths) for where to store the result of the operation.

Attempting to read a file that is larger than 5MB will result in an error.

![File Read Node Configuration](/images/workflows/data/file-read-node-configuration.png "File Read Node Configuration")

## Result

In the example above, the workflow will retrieve the contents of the file at the payload path `data.fileName`. If the result path is set to `data.result`, and the read operation was successful, your output would look like the following:

```json
{
  "data": {
    "result": {
      "bytesRead": 100,
      "content": "Some kind of file content that is on your edge machine, maybe a log file, maybe a configuration file..."
    }
  }
}
```

If the read was unsuccessful then the output would look like the following:

```json
{
  "data": {
    "result": {
      "error": {
        "type": "FILE_READ_ERROR",
        "message": "A message describing the reason for the error."
      }
    }
  }
}
```
