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

## Webhook Verification

Certain third party services, such Facebook, require webhooks to be verified
before use.  Generally this involves the webhook responding with a particular response
or response code to a particular kind of query.  Losant currently has support for
verifying a webhook against Facebook or Fitbit:

![Fitbit Webhook Verification](/images/applications/fitbit-webhook-verification.png "Fitbit Webhook Verification")

In the example above, the webhook is configured for Fitbit verification with the verification code `VERIFICATION_CODE_HERE` (and the hardcoded response code `204`, since Fitbit expects 204 responses).  For Fitbit, you can find the verification code to use in the `Subscriptions` table for your Fitbit application (after adding a webhook url as a Fitbit subscription).  You can read more about Fitbit webhook verification <a href="https://dev.fitbit.com/docs/subscriptions/#verify-a-subscriber" target="_blank">here</a>.

You can also choose to verify as a Facebook webhook.  In the case of Facebook, you provide your own verification code - on Facebook's side, it is called a `Verify Token`.  What you provide to Facebook as the Verify Token and what you provide to Losant as the Verification Code can be anything, as long as they match.  You can read more about Facebook webhook verification <a href="https://developers.facebook.com/docs/graph-api/webhooks" target="_blank">here</a>.

By default, the option of "No Verification" is selected for a webhook.  In this case, while there is no need for a verification code, we do allow you to specify the response code that Losant should respond with on when it receives a webhook request.  By default this is `200`, but can be changed to whatever response code is expected by the system sending the web request.

If there are other webhook verification systems that you would like Losant to support, please <a href="https://forums.losant.com/" target="_blank">let us know</a>.

## Deleting a Webhook

To delete a webhook, click the `delete` button on the webhook list.

![Delete Webhook](/images/applications/delete-webhook.png "Delete Webhook")

## Using Webhooks

For information on how to use Webhooks to trigger workflows checkout the [Webhook Trigger Documentation](/workflows/triggers/webhook/).

### Testing Webhooks

You can easily trigger a webhook for testing purposes right on the Webhook edit page.

![Test Webhook](/images/applications/test-webhook.png "Test Webhook")

You can fill in an optional path with query params, choose the request method, and fill in an optional JSON request body.  Clicking `Send Test Request` will trigger the Webhook just like an actual request against that Webhook's URL would - triggering any workflows linked to this Webhook with the provided request information.
