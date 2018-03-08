description: Learn more about deploying Losant Workflows to Edge Compute Devices.

# Edge Deployments

[Edge workflows](/workflows/edge-workflows/) are sent from the Losant platform down to [edge devices](/devices/edge-compute/) through scheduling **edge deployments**. An edge deployment is a scheduled rollout of a workflow version to one or more devices. It is treated as a separate resource within the [Losant REST API](/rest-api/edge-deployments/).

## Managing Edge Deployments

Edge deployments can be managed on a per-device basis or a per-workflow basis.

### Managing Per Device

![Device Edge Deployments](/images/edge-compute/device-edge-deployments.png "Device Edge Deployments")

After selecting a device from your device list, click "Edge Compute" in the left navigation. This will bring you to a page where you can view the Edge Agent version currently deployed to the device, as well as a list of all workflows deployed to the device and their version status.

Clicking the "Settings" (gear) icon in any deployment table row will allow you to edit that specific deployment, including changing the workflow version or canceling a scheduled rollout.

Clicking the "Deploy" button here will allow you to select a workflow, and then select an existing version of that workflow to deploy to this device. If you choose a workflow that is already deployed (or is scheduled to be deployed) to the device, you will have the option of changing the version of the workflow to use as if you had clicked the "Settings" icon for that workflow in the list below the button.

![Device Deployment Modal](/images/edge-compute/device-deployment-modal.png "Device Deployment Modal")

### Managing Per Workflow

First, choose a workflow to edit. You will then see a "Deploy" button alongside the "Save" button in the top right corner.

![Deploy and Save Edge Workflow](/images/workflows/workflow-edge-save-deploy.png "Deploy and Save Edge Workflow")

Clicking the "Deploy" button will present a modal for rolling out a deployment of the workflow version you are currently viewing. Select the devices using a [device query](/devices/device-queries/) (by name and/or by tag), remembering that only devices of the ["Edge Compute" type](/devices/overview/#device-type) are able to receive an edge workflow.

![Workflow Deployment Modal](/images/edge-compute/workflow-deployment-modal.png "Workflow Deployment Modal")

If you are viewing the "develop" version of your workflow, you will also have to create a new version before rolling out. A version name input will be prepopulated with the current date and time, but you can name this new version anything you'd like, so long as it does not conflict with an existing version of this workflow.

When selecting your devices, you will also be presented with a preview of the devices matching your query, including their current deployment status for the selected workflow. If the version you are deploying is incompatible with the Edge Agent on a device, the preview table will warn you of the issue; however, you will still be allowed to proceed with the deployment.

![Workflow Edge Deployments](/images/edge-compute/workflow-edge-deployments.png "Workflow Edge Deployments")

In the workflow editor, click the "Deploy" tab to view a list of all devices to which any version of this workflow is deployed or is scheduled to be deployed. Each of these deployments can be edited individually by clicking the "Settings" icon in that row; the version can be changed, the rollout can be canceled or the workflow can be removed from the device.

### Deployment Status

Multiple workflows can be deployed to an edge compute device, however only one version of a workflow may be on a device at one time. When viewing a list of deployments, the "Version" can be in one of three states:

* **Up to date**, signaled by a green checkmark alongside the version name. This indicates that the version of the workflow running on the device matches what should be on the device per your scheduled edge deployments.
* **Pending**, signaled by a gray clock. The version currently on the device is listed first, and the version that is scheduled to be deployed to the device is on the right side of the arrow. The rollout should occur the next time the device connects.
* **Error**, signaled by a red tick. For whatever reason (usually because a device's [Edge Agent](/edge-compute/edge-agent-installation/) is incompatible with the version you are trying to deploy), the deployment of a new version failed, and therefore the version listed to the left of the arrow is still running on the device. We will attempt to roll out the version listed on the right the next time the device connects.

## Deployment Logs

In the [per-device deployment manager](#managing-per-device), there is a list of scheduled, succeeded and failed edge deployments for that device. This list allows you to see who scheduled edge deployments, if those scheduled deployments were overridden by later deployments, and if and why any deployment failed, why the error occurred.

![Edge Deployment Logs](/images/edge-compute/edge-deployment-logs.png "Edge Deployment Logs")
