---
flowclass:
  - Edge 1.0.0
description: Learn more about the Losant Run Executable Node.
---

# Run Executable

The Run Executable Node allows an edge workflow to run a script or process locally on an [Edge Compute device](/devices/edge-compute/). This node is only available in [edge workflows](/workflows/edge-workflows/).

![Run Executable Node](/images/workflows/data/run-executable-node.png "Run Executable Node")

## Configuration

There are two main configuration sections for the Run Executable Node ...

### Command Configuration

![Run Executable Node Configuration](/images/workflows/data/run-executable-node-config.png "Run Executable Node Configuration")

* **Command:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for the command itself. This should resolve to a script or executable on the local machine. In the example above, the node will run the command `/opt/serial-reader/bin/read-state`.
* **Current Working Directory:** A string template for the directory from which to run the command. If you leave this blank, it will default to the working directory for the Losant [Edge Agent](/edge-compute/edge-agent-installation/).
* **Encoding:** The content encoding (defaults to UTF8).
* **Run in detached state?:** (edge version 1.2.3 and above) Run your executable command in a detached state. This will cause your result path to be empty if the command successfully started. However, if it did not successfully start then there will be an error in the result path.

### Environment Variables

![Run Executable Node Environment Variables](/images/workflows/data/run-executable-node-env-vars.png "Run Executable Node Environment Variables")

You can also set any number of environment variables for the command. By default, when the command is run, it will run with no environment variables. In the example above, one environment variable is set: `SERIAL_PORT` is set to `{{deviceTags.serialPort.[0]}}`.

## Result

![Run Executable Node Node Output](/images/workflows/data/run-executable-node-output.png "Run Executable Node Output")

Finally, if the command that is being executed returns a result, it can optionally be stored on the payload for later use in the workflow. In the example above, the result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) `data.myExecResults`. What is returned, though, is not just the result; rather, it is a result object with other useful information.

The result object will have fields for the command's `stdout` and `stderr`, as well as fields for the `exitCode` of the command and the termination `signal` for the command. In the case that a command fails to run, there will also be an `error` field with any errors. For example, here is an example payload after the above workflow node executes:

```json
{
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Example App",
  "data": {
    "myExecResults": {
      "stdout": "45",
      "stderr": "",
      "signal": null,
      "exitCode": 0
    },
    ...
  },
  "deviceId": "56c8967bb8df0f0100d629120",
  "deviceName": "My Factory Device",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "flowName": "Example Workflow",
  "flowId": "56c74add04d0b50100043381",
  "flowVersion": "My Version Name",
  "globals": { },
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "triggerId": "deviceCommand",
  "triggerType": "deviceCommand"
}
```

### Notes on Errors

There are many reasons that the Run Executable Node could error, but here are a few of the more common cases:

* The command given in the `Command` template does not exist or is invalid in some way.
* The path given for the `Current Working Directory` does not exist.
* The Losant Edge Agent did not have permission to execute the given command.
* The command took longer than the maximum allowed 30 seconds to complete.
