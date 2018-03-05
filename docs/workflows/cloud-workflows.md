description: Learn more about creating and configuring Losant Cloud Workflows.

# Cloud Workflows

Cloud workflows execute within Losant's cloud platform. Generally they are more robust than [edge workflows](/workflows/edge-workflows/) in regards to the available functionality, speed of execution and uptime.

## Advantages

There are a number of benefits that come with workflows of this type:

*   They can be triggered by a wide variety of events, such as [device connections](/workflows/triggers/on-connect/), messages from third-party sources and more.
*   You may edit application resources such as devices or anything else exposed in the [Losant API Node](/workflows/data/losant-api/).
*   You can [query device data](/workflows/data/time-series/) and [respond to experience endpoint requests](/workflows/outputs/endpoint-reply/) in order to build a custom UI for your end users.
*   Events emitted by one device can directly impact another without the devices speaking directly to each other.

## Limitations

The primary drawback of cloud workflows is the potential for network latency issues. For example, if you'd like to fire a workflow every time a device reports state, and firing that workflow is critical to the operation of your system, a slow internet connection (from the device reading state and sending it up to the cloud) could make or break your application.

Cloud workflows also do not have the ability to interact with any deployed device's operating system; they cannot execute scripts, write files or read inputs. They can, however, listen to a number of events emitted by the devices, such as [connections](/workflows/triggers/on-connect/), [disconnections](/workflows/triggers/on-disconnect/), [inactivity](/workflows/triggers/on-inactivity/) and [state reports](/workflows/triggers/device/), and in response they may [send commands to](/workflows/outputs/device-command/) or [report state on behalf of](/workflows/outputs/device-state/) your devices.

## Configuration

There are a handful of configuration options that are specific to cloud workflows ...

### Enabled Status

![Enable Workflow](/images/workflows/overview-enable.png "Enable Workflow")

Cloud workflows can be enabled or disabled with a simple toggle. Disabling a workflow stops any of its triggers from firing. This can be done either from your application's list of cloud workflows or within the "Properties" tab of the cloud workflow editor.

### Default Version

![Workflow Default Version](/images/workflows/workflow-default-version.png "Workflow Default Version")

Cloud workflows have the concept of a "default version", which is the [version](/workflows/versioning/) of the workflow to run in the absence of the version being specified in the trigger event. Some cloud triggers, such as the [Endpoint Trigger](/workflows/triggers/endpoint/), can target a specific [version](/workflows/versioning/) of your workflow. Conversely, other triggers, such as the [Timer Trigger](/workflows/triggers/timer/), will only ever fire on the default version.

## Saving and Deploying

Workflows are saved and deployed using the `Deploy Workflow` button.

![Deploy Workflow](/images/workflows/overview-deploy.png "Deploy Workflow")

The button will be green whenever there are changes that can be deployed. It will be gray when there are no changes. Once a workflow has been saved and deployed, its changes will take effect immediately.

If you are viewing a [workflow version](/workflows/versioning/), the button will not allow the deployment of any changes; instead, it will allow you to return to the Develop version.

## Deleting Cloud Workflows

Cloud workflows can be deleted directly by clicking the "Delete Flow" button at the bottom of the workflow's Properties panel. They can also be deleted by clicking the "Delete" icon in your application's workflow list.

![Delete Workflow](/images/workflows/workflow-delete.png "Delete Workflow")

Cloud workflows can also be deleted indirectly by deleting resources that depend directly on the workflow engine. For example, when deleting an [experience endpoint](/experiences/endpoints/#deleting-endpoints), you are presented with the option of also deleting any workflow triggered by a request to that endpoint. Take care when doing this, as this action will delete the entire workflow, and not just any series of nodes within the workflow that start from the endpoint trigger.

![Delete Workflow Through Resource](/images/experiences/delete-endpoint.png "Delete Workflow Through Resource")

When a cloud workflow is deleted, it ceases execution immediately – unlike deleting an edge workflow, the deletion of which must be rolled out to any devices to which the flow was deployed before they cease to fire.
