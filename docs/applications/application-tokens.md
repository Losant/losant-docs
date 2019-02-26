---
description: Learn about creating and managing Application API tokens in the Losant platform.
---

# Application API Tokens

Application tokens allow you to interact with a single [application](/applications/overview/) at a scope level you define. Using an application token, users can create, read, update or delete any child resource of the parent application – as well as the application itself.

## Viewing Application Tokens

You can view the the API tokens for an application by choosing `API Tokens` in the Application subnavigation.

The list of application tokens includes the token's name, a summary of its scope, its creator (which may be yourself, another member of your [organization](/organizations/overview/) or even another API token) and the token's [expiration date](#token-expiration-date).

![Application API Tokens](/images/applications/application-tokens.png "Application API Tokens")

## Generating an API Token

Application API tokens can be added to your application by using the `Add Application Token` button on the `Application API Tokens` page. Token setup requires four pieces of information ...

### Name and Description

The token's **name** is required, and it is simply for display purposes. The token's name in no way affects its functionality. Optionally, a longer **description** may be provided for additional information on the token.

### Token Expiration Date

Choose "**Never expires**" to keep the token from ever expiring. Or, choose "**Expires at ...**" and then set a future date / time after which requests using this token should no longer be accepted. (Default is one year from the time of token creation.)

![Application Token Expiration](/images/applications/application-token-expiration.png "Application Token Expiration")

Note that the expiration date **cannot be changed** after token creation. If the expiration date passes while the token is in use, you will have to generate a new token and replace it within your authentication requests.

### Token Permissions

There are three options for setting the token's scope ...

![Application Token Permissions](/images/applications/application-token-permissions.png "Application Token Permissions")

**All permissions** allows the token to create, read, update and delete sub-resources of the application, including (but not limited to) [devices](/devices/overview/), [device state reports](/devices/state/), [workflows](/workflows/overview/), additional application API tokens and the application itself. Losant resources and actions added in the future will automatically be accessible using an "All permissions" token.

**Read only** allows the token to read – but not modify – any application sub-resource. This includes reading (but not reporting) device [state](/devices/state/) and [commands](/devices/commands/), as well as [data queries](/rest-api/data/), [devices](/devices/overview/), [workflows](/workflows/overview/) and the application itself. Future Losant resources' "read" actions, as well as new "read" actions added to existing resources, will automatically be accessible using a "Read only" token.

**Custom ...** allows for selecting specific resource / action combinations from the [Losant REST API](/rest-api/application/) that the token should be allowed to access. Choosing this option reveals a list of all application-specific API calls in the Losant Platform, each of which may be individually added to the token's scope. For example, to only allow the querying of device data for use in a third-party dashboard tool, you might select only the checkboxes shown in this screenshot ...

![Application Token Custom Permissions](/images/applications/application-token-custom.png "Application Token Custom Permissions")

The checkboxes next to the resource names will automatically check or uncheck all actions under that resource. However, checking such a box does **not** provide the token access to any new actions that may be added under that resource in the future. If a new action is added under a resource, and you would like your token to have access to that action, you will have to generate a new token.

Note that a token's scope **cannot be changed** after token creation. If you find you need additional permissions not allowed by the token, you will have to create a new token. Likewise, if you would like to revoke permissions originally supplied to a token, you will have to [delete the token](#deleting-deactivating-an-api-token) and create a new one with the desired scope.

### Getting the Token

After clicking `Create Application Token`, the newly token will be displayed. You will either need to copy it to a secure location or download it to a file on your computer.

**IMPORTANT**: Losant does not store API tokens and they cannot be recovered or regenerated if lost. If you fail to save your token before closing the modal, you will have to generate a new application API token.

When you're finished, check the `I have copied my application token to a safe place` box and click `Close Window`.

![Application Token Generated](/images/applications/application-token-generated.png "Application Token Generated")

## Deleting / Deactivating an API Token

To temporarily deactivate an application API token ...

* Click the checkbox alongside the token in the list view, OR
* From the token's detail page, select the "Inactive" radio button under the "Status" label and save the token.

![Delete Token](/images/applications/delete-token.png "Delete Token")

If a token has expired, is no longer needed or is thought to have been compromised, you may permanently delete it by:

* Clicking on the `Delete` icon in the token list, OR
* Clicking the `Delete Application Token` button on the token's detail page

## Using API Tokens

To learn more about using API tokens with our REST API, check out the various [Losant REST](/rest-api/overview/) client libraries.
