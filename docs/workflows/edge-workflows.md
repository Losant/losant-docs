description: Learn more about creating and configuring Losant Edge Workflows.

# Edge Workflows

Edge workflows are configured within the Losant platform, but they are then [deployed](/edge-compute/edge-deployments/) to [edge devices](/devices/edge-compute/) where the flow's actual execution takes place.

## Advantages

When choosing a workflow type, there are a few benefits of edge workflows to consider ...

* Since edge workflows execute on their deployed devices, network latency issues are mitigated. If a snap decision needs to be made locally on the device (for example, shut its attached machine down if vibration levels exceed a certain threshold), that decision is no longer dependent on the device having an internet connection.
* Any payloads that the device should send up to the Losant platform are queued and sent up the next time the device establishes a connection. This allows for devices to be deployed in the field where internet connectivity may be sparse; it also allows for battery conservation as the device needs only to connect intermittently to report its collected data.
* Edge workflows have a few special nodes that allow for [reading](/workflows/data/file-read/) and [writing](/workflows/data/file-write/) to the device's file system, [executing scripts](/workflows/data/run-executable/) and interacting with connected devices such as [Modbus](http://www.modbus.org/).

## Limitations

The main limitation of edge workflows is a lack of functionality that is available within [application workflows](/workflows/application-workflows/). For example, edge workflows cannot [edit Losant resources](/workflows/data/losant-api/) or send messages through [email](/workflows/outputs/email/) or [SMS](/workflows/outputs/sms/) (without using [SendGrid](/workflows/outputs/sendgrid/) or [Twilio](/workflows/outputs/twilio/) respectively).

Also, changing or removing an edge workflow from a device requires the device to have an internet connection, which means that workflows deployed to edge devices could continue executing previously deployed versions until those devices establish a connection to the Losant platform.

## Configuration

There are a few configuration options that are specific to edge workflows.

### Workflow Storage

![Edge Workflows Storage Tab](/images/workflows/edge-storage-tab.png "Edge Workflows Storage Tab")

You may still use the [Storage: Get Value](/workflows/data/get-value/) and [Storage: Set Value](/workflows/data/store-value/) Nodes in an edge workflow; however, the values are specific to each device where the workflow is deployed, and there is no way to tell what the current values stored on the device are. Therefore, the [workflow storage tab](/workflows/overview/#workflow-storage) offers no way to view or set storage values for edge workflows.

### Debugging

![Debugging Edge Workflows](/images/workflows/edge-compute-debug.png "Debugging Edge Workflows")

When debugging edge workflows, it is necessary to choose a single device to view debug output from. This requires the device to have a version of the workflow deployed to it and to have an internet connection at the time you wish to debug. You may switch the selected device at any time.

### Edge Agent Version

![Workflow Edge Agent Tab](/images/workflows/workflow-edge-agent-tab.png "Workflow Edge Agent Tab")

In order to utilize newly released edge workflow functionality (such as new nodes), it is necessary to upgrade your workflow's [Edge Agent](/edge-compute/edge-agent-changelog/) – and to deploy the new agent to your edge compute devices.

To do this, use the Edge Agent tab in the workflow editor. The upgrade can only be applied to the "develop" version. If you upgrade the Edge Agent version and make changes to your "develop" workflow, you will have to create new [versions](/workflows/versioning/) of the workflow before deploying them to your devices.

## Payload

The fields on a triggering payload for an edge workflows are very similar to what is available on application workflows, with a few edge-only additions. The following are the initial root fields on all edge payloads:

* **agentEnvironment** is an object of the current environment variables for the Edge Agent (minus any Edge Agent configuration environment variables). This is unique to edge workflows, and only available in Edge Agent version 1.2 or greater.
* **applicationId** is the ID of the Losant application that the Edge Agent (and the workflow) belong to.
* **applicationName** is the name of the Losant application that the Edge Agent (and the workflow) belong to.
* **data** is an object with trigger-specific data - the contents of this object change significantly based on the workflow trigger.
* **deviceId** is the ID of the Losant Edge Agent device.
* **deviceName** is the name of the Losant Edge Agent device.
* **deviceTags** is an object of the tags for the Losant Edge Agent device.
* **flowId** is the ID of the current Losant workflow that is running.
* **flowName** is the name of the current Losant workflow that is running.
* **flowVersion** is the version of the current Losant workflow that is running.
* **globals** is an object of any workflow or application globals available to this Edge Agent.
* **isConnectedToLosant** is a boolean representing if the Edge Agent is currently connected to Losant. This is unique to edge workflows, and only available in Edge Agent version 1.2 or greater.
* **time** is the timestamp of the current workflow run.
* **triggerId** is the ID of the trigger that caused this workflow run.
* **triggerType** is the type of trigger that caused this workflow run.

## Saving and Deploying

Unlike application workflows and experience workflows, saving and deploying edge workflows are two separate actions, and saving a workflow is not enough to propagate the changes to your edge devices.

![Deploy and Save Edge Workflow](/images/workflows/workflow-edge-save-deploy.png "Deploy and Save Edge Workflow")

### Saving Changes

The "Save" button will be green whenever there are changes to your "develop" workflow version. When there are no pending changes, the button will be disabled. The button is only present when viewing the "develop" version and if you have [edit permissions](/organizations/members/#member-roles) for the edge workflow in question.

### Deploying Versions

Any version of an edge workflow can be [deployed](/edge-compute/deployments/) by clicking the "Deploy" button in the top right corner. This will display a configuration modal for which devices to deploy the selected workflow to. If you are viewing the "develop" version when the "Deploy" button is clicked, you will have to create a new version as part of the process.

More information on deploying edge workflows is available within the [edge compute documentation](/edge-compute/edge-deployments/).

## Deleting Edge Workflows

Edge workflows can be deleted directly by clicking the "Delete Flow" button at the bottom of the workflow's Properties panel. They can also be deleted by clicking the "Delete" icon in your application's workflow list.

![Delete Workflow](/images/workflows/workflow-delete.png "Delete Workflow")

Note that deleting an edge workflow - or a deployed version - will remove the workflow from all devices where it is deployed **only once the device is connected to the platform**. If the device is offline, it will continue to execute the workflow until it reconnects and receives the deletion message.
