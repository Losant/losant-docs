# Webhooks

Webhooks are defined HTTP endpoints within the Losant Platform that can be used to trigger workflows from external sources.

## Viewing Webhooks

You can view the available webhooks through the `Webhooks` item under the `More` menu.

![Webhooks](/images/applications/webhooks.png "Webhooks")

## Creating a Webhook

Webhooks can be added to your application by using the `Add Webhook` button.

![Add Webhook](/images/applications/add-webhook.png "Add Webhook")

Simply type in a meaningful name for you to reference later on while building workflows and click the `Save Webhook` button.

![Save Webhook](/images/applications/save-webhook.png "Save Webhook")

A unique URL is generated for every webhook and can found on the `Edit Webhook` screen.

![Edit Webhook](/images/applications/edit-webhook.png "Edit Webhook")

## Deleting a Webhook

To delete a webhook, click the `delete` button on the webhook list.

![Delete Webhook](/images/applications/delete-webhook.png "Delete Webhook")

## Using Webhooks

For information on how to use Webhooks to trigger workflows checkout the [Webhook Trigger Documentation](/workflows/triggers/webhook/).

### Testing Webhooks

You can easily trigger a webhook for testing purposes right on the Webhook edit page.

![Test Webhook](/images/applications/test-webhook.png "Test Webhook")

You can fill in an optional path with query params, choose the request method, and fill in an optional JSON request body.  Clicking `Send Test Request` will trigger the Webhook just like an actual request against that Webhook's URL would - triggering any workflows linked to this Webhook with the provided request information.
