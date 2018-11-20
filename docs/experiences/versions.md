description: Learn more about creating and using experience versions in the Losant platform.

# Experience Versions

Experience versions are frozen snapshots of a [portion of your application experience resources](#versioned-resources) that can be published to an experience domain or slug.

## Viewing Experience Versions

To view a list of your experience versions, click the "Versions" link within the "Experience" dropdown menu in your application navigation.

![Experience Versions List](/images/experiences/experience-versions-list.png "Experience Versions List")

There will always be at least one version in the list: your "develop" version, which is the only editable experience version. All other versions in the list are frozen and cannot be directly edited.

The list of experience versions also indicates which domains and slugs (if any) are pointed at each version.

### Viewing Version Contents

To view the resources within an experience version, simply click the name of the version in the list. This will take you to an interface where you can browse the views, workflows and endpoints that make up the version.

![Experience Version Details](/images/experiences/experience-version-details.png "Experience Version Details")

If you are viewing any version besides "develop", none of the resources will be editable. You will need to [copy the version to "develop"](#editing-experience-versions) if you wish to make any edits.

## Creating an Experience Version

To create a new experience version, click the "Create Version ..." button atop the versions list.

![Create Experience Version Button](/images/experiences/create-experience-version-button.png "Create Experience Version Button")

This will open a configuration modal with the following options:

*   **Version Name**, a required field which must be unique within your application. By default the new version name is the current date and time but this can be changed to anything you'd like; for example, many Losant users follow the [semantic versioning specification](https://semver.org/).
*   **Notes**, an optional field where you can put any information about the new version, such as significant changes or bug fixes.
*   **Domains and Slugs** that should be pointed to the new version. This is also optional and can be changed at a later date within the domain / slug edit pages. Any changes made here will take effect immediately upon version creation.

![Create Experience Version Modal](/images/experiences/create-experience-version-modal.png "Create Experience Version Modal")

When ready, click the "Create Version" button at the bottom of the modal, and all experience views, workflows and endpoints within your "develop" version will be frozen as part of your new experience version. Within the "develop" version, those resources will remain unchanged and you can continue to edit them as before.

## Pointing Domains at Versions

At any time, you may change which of your experience versions the requests to your experience domains or slugs resolves to. From the lists of domains and slugs, select the item you wish to edit, and on the next screen, choose the version you wish to use from the dropdown menu. The change takes effect immediately on save.

![Experience Domain Change Version](/images/experiences/experience-domain-change-version.png "Experience Domain Change Version")

You may also clear the version from the domain without assigning a new one; doing so means all requests to the domain will fail until a version is reassigned to it.

## Editing Experience Versions

The resources within an experience version **cannot be directly edited**; the views, workflows and endpoints are frozen as part of the version. However, much like with workflow versions, you can copy one of your published versions to your "develop" version and make edits there.

To do so, click the "Copy to develop" link next to the chosen version within the versions list.

![Copy Version to Develop Button](/images/experiences/copy-version-to-develop-button.png "Copy Version to Develop Button")

This will bring up a modal asking you to confirm the change, as doing so will completely overwrite your existing "develop" version. You will also have the option of automatically saving the current "develop" version as a new version so the resources are not lost forever. The new version will be given the name "develop-backup-{CURRENT_DATETIME}".

![Copy Version to Develop Modal](/images/experiences/copy-version-to-develop-modal.png "Copy Version to Develop Modal")

At this point, the resources within the version can be modified or deleted, and new resources can be added. When you are finished making changes, you can save "develop" as a new version and, optionally, point one or more of your domains to the new version. 

## Benefits

It is possible to build out a full application experience without using the experience versioning feature, but we strongly recommend doing so for the following reasons:

*   Creating versions allows for updating an experience after initial publication without disrupting your end users, as you can make changes within the "develop" version (which can be pointed at a staging domain) and only publish the changes to your production domain once the edits are complete.
*   Experience versioning makes it much easier to host two or more disparate end user experiences that are backed by the same Losant application data, as different domains can be pointed at different published versions.
*   Creating experience versions provides a means for revision history as the entire experience can be saved as a new version at any time. You may then look back at any past version or even copy the resources to the "develop" version for further editing.

## Versioned Resources

The following resources are frozen as part of an experience version:

*   [Experience views](/experiences/views/) of all types
*   [Experience workflows](/workflows/experience-workflows/)
*   [Experience endpoints](/experiences/endpoints/)

These resources will continue to exist within the application version even if their counterparts are deleted within the "develop" version.

##  Unversioned Resources

Special care should be taken regarding the following resources when building out an experience version:

*   [Experience users](/experiences/users/) exist outside of the versioning architecture, as do [experience groups](/experiences/groups/) - specifically, which users are a member of a group.
*   [Application global variables](/applications/overview/#application-globals), which can be referenced in experience workflows, are unaffected by experience versions. Changing an application global value will affect any experience workflow referencing the value.
*   [Workflow storage](/workflows/overview/#workflow-storage) spans across all workflow versions, including across experience workflow versions.
*   [Cloud workflows](/workflows/cloud-workflows/) that employ [Endpoint Trigger](/workflows/triggers/endpoint/) and [Endpoint Reply](/workflows/outputs/endpoint-reply/) Nodes are not versioned as part of the experience. We recommend migrating any cloud workflows whose sole purpose is to handle endpoint requests to a new experience workflow so they get versioned along with the rest of the experience.

## Deleting Experience Versions

Experience versions other than "develop" can be deleted one of two ways:

![Delete Experience Version Button](/images/experiences/delete-experience-version-button.png "Delete Experience Version Button")

*   Individually, by clicking the "Delete" icon next to any version you wish to delete within the versions list
*   In bulk, under the "Settings" > "Delete Resources" tab in your application's navigation by selecting "Delete Experience Versions" and submitting the form

![Bulk Delete Experience Versions](/images/experiences/bulk-delete-experience-versions.png "Bulk Delete Experience Versions")

Once an experience version is deleted, any requests made to a domain that was pointed to that version will fail until that domain is pointed to a different experience version.