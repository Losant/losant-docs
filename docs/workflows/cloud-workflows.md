description: Learn more about creating and configuring Losant Cloud Workflows.

# Cloud Workflows

TBD maybe this is just a section of the workflow overview? cloud vs edge?


## Saving and Deploying

Workflows are saved and deployed using the `Deploy Workflow` button.

![Deploy Workflow](/images/workflows/overview-deploy.png "Deploy Workflow")

The button will be green whenever there are changes that can be deployed. It will be gray when there are no changes. If you are viewing a [workflow version](/workflows/versioning/), the button will not allow the deployment of any changes; instead, it will allow you to return to the Develop version.

Workflows can be enabled and disabled by clicking the `Enabled` checkbox on the workflow settings panel, and then clicking the "Update" button. The workflow settings panel can be displayed by clicking the gear icon in the right dock.

![Enable Workflow](/images/workflows/overview-enable.png "Enable Workflow")

Once a workflow has been deployed, its changes will take effect immediately.



## Workflow Types

There are two types of workflow, and while they do share many common characteristics, there are key differences between the two and not all nodes are available for each workflow type.

After a workflow has been created, its type may not be changed. If there are nodes within a workflow that you would like to use within a workflow of a different class, you copy/paste those nodes across the workflows or [export the nodes and import them](#import-export) into the destination workflow. Note, however, that the import will fail if your selection contains invalid nodes for the destination type.

### Cloud Workflows

Cloud workflows execute within Losant's cloud-based platform. There are a number of benefits that come with these workflows:

*   They can be triggered by a wide variety of events, such as device connections, messages from third-party sources and more
*   You may edit application resources such as devices or anything else exposed in the Losant API Node
*   You can query application data and respond to experience endpoint requests in order to build a custom UI for your end users

The primary drawback of cloud workflows is the potential for network latency issues. For example, if you'd like to fire a workflow every time a device reports state, and firing that workflow is critical to the operation of your system, a slow internet connection (from the device reading state and sending it up to the cloud) could make or break your application.

### Edge Workflows

Edge workflows run directly on your [edge compute devices](/devices/edge-compute/). Since the flow executes on the device and is not dependent on an internet connection, network latency issues are mitigated. While edge workflows do expose some functionality not available in cloud workflows, in general they are less robust.

We have additional documentation that goes into more detail about [edge workflows](/workflows/edge-workflows) and [deploying them](/edge-compute/edge-deployments/) to your [edge compute devices](/devices/edge-compute/).
