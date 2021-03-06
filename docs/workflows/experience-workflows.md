---
description: Learn more about creating and configuring Losant Experience Workflows.
---

# Experience Workflows

Experience Workflows run in Losant's cloud and are designed for the data handling and custom back-end logic for [Application Experiences](/experiences/overview/). They can only be triggered by [Experience Endpoints](/experiences/endpoints/) and they are versioned as part of an [Experience Version](/experiences/versions/).

## Advantages

Experience workflows are versioned along with your application experience, which makes it easier to keep them in sync with changes you make to your [endpoints](/experiences/endpoints/) and [views](/experiences/views/).

While it is entirely possible to build a full application experience without using experience workflows, doing so means missing out on the versioning functionality that is built into experiences. In other words, every time you published a new version of your application experience, you would have to maintain your workflows independently of any versions created within your experience.

## Limitations

The primary limitation of experience workflows is they lack some of the functionality available in application workflows - particularly when it comes to [workflow triggers](#triggers). But since experience workflows are meant primarily for handling experience endpoint requests, this lack of functionality should not be an issue for most users, and any desired behavior can instead be accomplished within an application workflow.

## Differences From Application Workflows

Generally speaking, experience workflows and application workflows are functionally similar, but there are a few differences.

![Experience Workflow Triggers](/images/workflows/experience-workflow-triggers.png "Experience Workflow Triggers")

### Triggers

The only triggers available in an experience workflow are the [Endpoint Trigger](/workflows/triggers/endpoint/) and the [Virtual Button](/workflows/triggers/virtual-button/). The Endpoint Trigger will only fire on requests made to domains or slugs pointed at the workflow's experience version. All other workflow nodes are available.

### Debugging

When viewing an experience workflow version - including the "develop" version - the debug log will only include workflow runs matching that version. By contrast, when viewing an application workflow, the debug log includes workflow runs from **all versions** of the workflow.

### Versioning

An experience workflow cannot be versioned independently of your other experience resources. Rather, they must be versioned along with your other experience workflows, [views](/experiences/views/) and [endpoints](/experiences/endpoints/) by creating a new experience version.

## Saving and Deploying

Much like application workflows, only the "develop" version of an experience workflow can be edited, and any changes you make will immediately take effect for any domains or slugs that are pointed to the "develop" version.

## Deleting Experience Workflows

To delete an experience workflow, click the "Delete Flow" button at the bottom of the workflow's Properties panel while viewing the "develop" version. They can also be deleted by clicking the "Delete" icon in a list of your experience's "develop" workflows.

![Delete Workflow](/images/workflows/workflow-delete.png "Delete Workflow")

Only the "develop" version of an experience workflow can be deleted; to delete a version, it is necessary to delete the entire experience version.

Note that, should you delete the "develop" version of an experience workflow that had been previously included in an experience version, the version of that workflow will continue to exist within that experience version. You may still view that version of the experience workflow within the version, and if you wish to edit it, you may copy the whole version to "develop".