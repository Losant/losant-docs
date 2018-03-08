flowclass: Edge 1.0.0
description: Learn more about the Losant Write: Read Node.

# File Write

The File Write Node allows you to write to a file on your [Edge Compute device](/edge-compute/overview/). This node is *only* available in workflows for your [Edge Device Agent](/edge-compute/edge-agent-usage/).

![File Write Node](/images/workflows/data/file-write-node.png "File Write Node")

## Configuration

There are four configuration settings for this node - file path template, encoding, file content, how to handle writing the file if it exists. All fields expect for encoding are [templatable](/workflows/accessing-payload-data/#string-templates) and can be pulled off of the current workflow payload.

The required fields are file path template, encoding, and file content. The file path template should resolve to the location and file that should be written to. If the file does not exist, we will automatically create it and write the content to that file. By default encoding is `UFT8`. However the following are supported encodings: `ASCII`, `UTF8`, `UFT16LE`, `Base64`, `Binary`, `Hex`. The file content will be the resolved text of the "File Content Template" field, or appended to the file depending on your selection of `If file exists`.

In the `If file exists` selection you have three options:

1. *Cancel and return an error if the file exists* - with this option only write to a file that is nonexistent to avoid overwriting the wrong file.
2. *Append my content to the file if it exists* - this will cause the content to be appended at the end of the file, so all the content currently in the file will stay, the node will simply add to the content.
3. *Overwrite the file with my new content if it exists* - this is the default, with this option it allows you to completely replace the file with the content from the node.

![File Write Node Configuration](/images/workflows/data/file-write-node-configuration.png "File Write Node Configuration")

The only optional field is the result path. If the result path is set to `data.result` and the write was successful, the result will look like the following:

```json
{
  "data": {
    "result": {
      "value": true
    }
  }
}
```

If the read was unsuccessful then the output would look like the following:

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
