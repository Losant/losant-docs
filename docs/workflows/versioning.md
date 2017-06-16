# Working With Workflow Versions

With workflow versioning, it is possible to save multiple versions of a [Losant workflow](/workflows/overview/) and run specific versions of that workflow based on the payload it receives. Doing so allows you to actively develop a workflow that is currently in production use, test it without disrupting current functionality, and then deploy those changes once the updates are complete.

![Workflow Versioning](/images/workflows/versioning/overview.png "Workflow Versioning")

Workflow versioning is only available within applications owned by an [organization](/organizations/overview/). If you require workflow versioning functionality for one of your [Sandbox](/user-accounts/sandbox/) applications, you will need to migrate that application to an organization.

## Creating Versions

Every workflow has at least a "Develop" version. When creating a new workflow (or when using workflows created prior to the release of the versioning feature), Develop will be the only available version, and it will be set as the "Default" workflow.

![Create Version Button](/images/workflows/versioning/create_version_btn.png "Create Version Button")

New workflow versions can only be created from the Develop version. To create a version, click the "Versions" tab within the workflow editor. Then, click the "Create New Version" button. This will present a form with the following fields:

![Create Version Modal](/images/workflows/versioning/create_version_modal.png "Create Version Modal")

*   **Version Name:** This required field is the identifier you will use to invoke a specific version within your payloads. This can be any string except "develop" or "default", though we recommend following [semantic versioning](http://semver.org/). If you provide a name that matches another version within that workflow, you will be prompted to confirm that you wish to overwrite that version.
*   **Make this the default version:** This is a shortcut to mark the new version as the workflow's default. The default version can be changed at any time.
*   **Notes:** Optionally, you may provide some more details on what this specific version entails.

## Working With Versions

By default, when first visiting a workflow, you will be presented with its default version. To view other versions, click the Versions tab in the right column. In there you will find a list of the workflow's versions; click the version name to view it. (The currently viewed version is bolded and unlinked.)

Once you have selected a version, you will see that version name as a tag alongside the workflow's name at the top of the page. The button and dropdown menu in the top right corner will also reflect actions available for that version.

![Selected Version](/images/workflows/versioning/selected_version.png "Selected Version")

A version's nodes, connectors and [global variables](/workflows/overview/#workflow-globals) are specific to that version. Other than within the Develop version, these items are not editable (except as described [below](#editing-existing-versions)), but you can still view their configuration.

There are a few actions you may take relative to a version:

*   Any version can be set as the workflow's default. It is this version that runs when a payload hits the workflow without a [specific version specified](#triggering-specific-versions).
*   Versions can have their contents copied to Develop, where they can then be edited and saved as a new version.
*   Versions can be [exported](/workflows/overview/#import-export) either to a JSON file or, if you have [edit permissions](/organizations/members/#member-roles) within the application, to a new workflow.
*   Any version besides Develop can be individually disabled.
*   Any version besides Develop, or the current default version, can be deleted. This action cannot be undone.

### Editing Existing Versions

![Read Only Version](/images/workflows/versioning/version_read_only.png "Read Only Version")

Once a workflow version has been created, **its nodes, connectors and globals cannot directly be edited**. Rather, if you need to make changes to an existing workflow:

1.   Copy the version to Develop. (You may want to save your current Develop as a new version so you don't lose any changes made since your last version creation.)
2.   After copying, make any necessary edits to the workflow and save your changes.
3.   Create a [new workflow version](#creating-versions), setting its name to the same as the version you need to overwrite.

### Workflow Properties That Are Not Version-Specific

Not every property of a workflow can be changed on a per-version basis:

*   **[Workflow storage](/workflows/overview/#workflow-storage) values span across all workflow versions.** If your application requires using workflow storage on a per-version basis, we recommend prefixing your storage keys with the name of your workflow version.
*   A workflow's **name and description**, when modified, will change across all workflow versions. Any identifying or descriptive information about a workflow version can be stored in the version's name and notes.
*   If a workflow is disabled, **all versions of the workflow are also disabled**, regardless of that version's specific enabled / disabled state.

### Workflow Versions Migrated to a Sandbox

If you [transferred an application](/organizations/transferring-resources/) from an organization to a Sandbox, and that application had one or more workflows with versions, there are a few key points to consider:

*   **You will no longer be able to access these versions** unless you migrate that application back to an organization.
*   If one of that workflow's versions other than "Develop" is set as the default workflow, **that version will continue to run as the default workflow**. This means that triggers that only fire on the default workflow will continue to run that default workflow, and those runs will generate payloads that count against your [resource limits](/organizations/resource-limits/).
*   For triggers that can run a specific workflow version, if a version name is passed as part of the payload, **the payload will still trigger the specified version**.

## Triggering Specific Versions

When sending a payload to the platform, you may optionally include a version name to run for any workflows triggering off of that payload. If a version is not specified, the triggers will run the default workflow; if a version is specified but the version does not exist, the workflow will not fire.

![Triggers in Versions](/images/workflows/versioning/version_dead_triggers.png "Triggers in Versions")

Only the following trigger types can fire a specific workflow version:

*   [Endpoints](/workflows/triggers/endpoint/) and [webhooks](/workflows/triggers/webhook/) invoke specific versions by including an HTTP header with the name `X-Flow-Version` and a value matching one of your version names.
*   [Device triggers](/workflows/triggers/device/) fire workflow versions by including a `flowVersion` root-level property in the body of your request (either via [HTTP](/rest-api/device/#send-state) or [MQTT](/mqtt/overview/#publishing-device-state)). The value of the property is the name of the workflow you wish to invoke.
*   [Google Pub/Sub](/workflows/triggers/google-pub-sub/) allows for the passing of [attributes](https://cloud.google.com/pubsub/docs/publisher) with your messages. Include an attribute with the key `flowVersion` and a workflow version name as the value in order to invoke that version.
*   [Virtual Buttons](/workflows/triggers/virtual-button/), when clicked, will simply fire the version that the button is a part of. To invoke a virtual button press [through the API](/rest-api/flow/#press-virtual-button), include a `flowVersion` root-level property in the body of your request. The value of the property is the name of the workflow you wish to invoke.

All other trigger types will only fire if they are part of the workflow's default version. Triggers that will not fire for this reason are indicated as such within the workflow editor.