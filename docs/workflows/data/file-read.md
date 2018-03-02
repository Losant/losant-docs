flowclass: Edge 1.0.0
description: Learn more about the Losant File: Read Node.

# File Read

The File Read Node allows you to read a file from disk on your [link](Edge Compute device). This node is *only* available on your edge device.

![File Read Node](/images/workflows/data/file-read-node.png "File Read Node")

## Configuration

There are four configuration settings for this node - file path, encoding, start position, bytes to read, and result path. All fields, except for encoding, are [templatable](/workflows/accessing-payload-data/#string-templates) and can be pulled off of the current workflow payload.

File path, encoding and result path are required. By default encoding is `UFT8`. However the following are supported encodings: `ASCII`, `UTF8`, `UFT16LE`, `Base64`, `Binary`, `Hex`. The field `start position` is not required and if it is not defined will default to the beginning of the file. This field accepts only integers. If the number is positive, it will start reading from that byte in the file. If the number is negative it will be interpreted as the last n bytes of the file, e.g. -10, means start 10 bytes before the end of file. The field `bytes to read` is also not required, and if it is not defined will be set to the number of bytes in the file. Thus if the node should read the entire file then both fields should be left blank. However, there is a limit of 5MB to read, if the file is larger than this an error will be returned.

![File Read Node Configuration](/images/workflows/data/file-read-node-configuration.png "File Read Node Configuration")

## Result

In the example above, the workflow will retrieve the contents of the file at the payload path `data.fileName`. If the result path is set to `data.result`, and the read was successful your the output would look like the following:

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
