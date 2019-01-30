---
flowclass:
  - Edge 1.3.0
description: Learn more about the Losant File Watch Trigger.
---

# File Watch Trigger

The File Watch Trigger will trigger a workflow whenever the [Edge Compute device](/devices/edge-compute/) sees file or directory changes on the configured path.

![File Watch Trigger](/images/workflows/triggers/file-watch-trigger.png "File Watch Trigger")

## Configuration

There are two configurable criteria for a File Watch Trigger: the file system path to watch, and the types of watch events to trigger on. You can choose to trigger on any combination of adding files, changing files, removing files, adding directories, or removing directories. Remember, the file system path is a path on the file system of the [Edge Compute device](/devices/edge-compute/) where the Edge Agent is running.

## Payload

The payload will include information about the event and the triggering file or directory. The `stats` about the file or directory are only available for creation or modification, not deletion. In the general case, a File Watch workflow payload will look like the following:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "data": {
    "event": <event type - "fileAdded" / "fileChanged" / "fileRemoved" / "directoryAdded" / "directoryRemoved">,
    "fullPath": <full name and path to the file or directory that caused the event>,
    "pathParts": {
      "dir": <parent directory path>,
      "base": <full name of the triggering file or directory>,
      "ext": <extension of the triggering file or directory>,
      "name": <name (without extension) of the triggering file or directory>
    },
    "stats": {
      "createdAt": <creation time of the triggering file or directory>,
      "modifiedAt": <last modified time of the triggering file or directory>,
      "size": <size (in bytes) of the triggering file or directory>
    }
  },
  "deviceId": <id of the edge device>,
  "deviceName": <the edge device name>,
  "deviceTags": {<any tags for the edge device>},
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <name of the current workflow version>,
  "globals": <object of workflow globals>,
  "isConnectedToLosant": <if the agent is connected to Losant>,
  "agentEnvironment": <object of environment variables>,
  "time": <time of the watch event arrived>,
  "triggerId": <id of the file watch trigger>,
  "triggerType": "fileWatch"
}
```
