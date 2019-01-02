---
description: Learn about creating and managing Webhooks for a Losant Application.
---

# Webhooks

Webhooks are defined HTTP endpoints within the Losant Platform that can be used to trigger [workflows](/workflows/overview/) from external sources.

## Viewing Webhooks

You can view the available webhooks under `Webhooks` in the Application menu bar.

![Add Webhook](/images/applications/add-webhook.png "Add Webhook")

Click a webhook's name in the list to view its configuration, make edits or view workflows associated with the webhook.

## Creating a Webhook

Webhooks can be added to your application by using the `Add Webhook` button. A name is all that is required to create the webhook, which you will use to reference the webhook in [workflows](/workflows/overview/) or other implementations. The name can be changed at any time.

You also have the option to set verification and webhook reply options. More info on those is available below.

![Save Webhook](/images/applications/save-webhook.png "Save Webhook")

A unique URL is generated for every webhook and can found on the `Edit Webhook` screen, as well as in the list of webhooks.

![Webhooks](/images/applications/webhooks.png "Webhooks")

## Webhook Verification

Certain third party services, such Facebook, require webhooks to be verified before use. Generally this involves the webhook responding with a particular response or response code to a particular kind of query. Losant currently has support for verifying a webhook against Alexa, Facebook, Fitbit, or Twilio:

![Fitbit Webhook Verification](/images/applications/fitbit-webhook-verification.png "Fitbit Webhook Verification")

In the example above, the webhook is configured for Fitbit verification with the verification code `VERIFICATION_CODE_HERE` (and the hard coded response code `204`, since Fitbit expects 204 responses). For Fitbit, you can find the verification code to use in the `Subscriptions` table for your Fitbit application (after adding a webhook url as a Fitbit subscription). You can read more about Fitbit webhook verification <a href="https://dev.fitbit.com/docs/subscriptions/#verify-a-subscriber" target="_blank">here</a>.

You can also choose to verify as a Facebook webhook. In the case of Facebook, you provide your own verification code - on Facebook's side, it is called a `Verify Token`. What you provide to Facebook as the Verify Token and what you provide to Losant as the Verification Code can be anything, as long as they match. You can read more about Facebook webhook verification <a href="https://developers.facebook.com/docs/graph-api/webhooks" target="_blank">here</a>.

Twilio does not actually require verification, but requires a very specific response in order for Twilio not to consider it an error - a TwiML XML response. Selecting the Twilio option tells Losant to reply with a body that Twilio expects (an empty TwiML response) so that the webhook call does not look like an error to Twilio.

Alexa skills must verify that each request to the skill is from an Alexa. This type of webhook will verify that each request to the webhook has valid headers `Signature`, `SignatureCertChainUrl`, and `Timestamp`. The timestamp must show the request is no older than 150 seconds (2 minutes and 30 seconds). For more information on how to host an Alexa custom skill check out this <a href="https://developer.amazon.com/docs/custom-skills/host-a-custom-skill-as-a-web-service.html" target="_blank">site.</a>

By default, the option of "No Verification" is selected for a webhook. In this case, while there is no need for a verification code, we do allow you to specify the response code that Losant should respond with on when it receives a webhook request. By default this is `200`, but can be changed to whatever response code is expected by the system sending the web request.

If there are other webhook verification systems that you would like Losant to support, please <a href="https://forums.losant.com/" target="_blank">let us know</a>.

## Basic Auth

You can optionally choose to require HTTP basic auth when calling a webhook. This can be useful if you want a layer of security on top of your webhook calls beyond just the webhook token itself.

![Webhook Basic Auth](/images/applications/webhook-basic-auth.png "Webhook Basic Auth")

If the basic auth fields are left blank, no authentication is required. If either the username or password field is filled in, then Losant expects the standard basic auth HTTP header to be set on any incoming webhook requests with that username and/or password. It is perfectly acceptable to only set a username or only set a password, in which case Losant just expects the other to be an empty string on any incoming requests.

## Custom Replies

Sometimes, it can be very useful to respond back to a given webhook call. In those cases, Losant offers the ability for workflows to reply to webhook triggers using the [Webhook Reply Node](/workflows/outputs/webhook-reply/). By default, webhooks do not wait for a reply to be generated by a workflow, so if you intend for a workflow to reply to a webhook trigger, the `Wait for reply from workflow` checkbox must be checked in the settings for that webhook.

![Custom Replies](/images/applications/webhook-reply.png "Custom Replies")

When this checkbox is checked, any call against this webhook will generate a `replyId` which will be included in the payload for any workflows triggered by this webhook. Losant will wait up to 30 seconds for a reply to be created for this `replyId` using a Webhook Reply Node. If no reply is generated, the webhook will respond with a timeout error. If multiple replies are generated, the first reply will be the one used. See the documentation for the [Webhook Reply Node](/workflows/outputs/webhook-reply/) for more details.

## Deleting a Webhook

If you no longer need a webhook, you may delete it by clicking the `Delete` icon on the webhook list or by clicking the `Delete Webhook` button on the detail screen.

![Delete Webhook](/images/applications/delete-webhook.png "Delete Webhook")

When deleting a webhook, you also have the option of deleting any [workflows](/workflows/overview/) triggered by that webhook. Note that this action deletes **any workflow with a [Webhook Trigger Node](/workflows/triggers/webhook/) matching this webhook**. If you wish to save your workflows and change out their triggers, or if the workflows are triggered by multiple conditions and you wish to retain them, you should leave this option unchecked.

## Using Webhooks

For information on how to use Webhooks to trigger workflows checkout the [Webhook Trigger Documentation](/workflows/triggers/webhook/).

### Testing Webhooks

You can easily trigger a webhook for testing purposes right on the Webhook edit page.

![Test Webhook](/images/applications/test-webhook.png "Test Webhook")

In the example above, you can fill in an optional path with query params, choose the request method, and the body (if provided) must be valid JSON. Clicking `Send Test Request` will trigger the Webhook just like an actual request against that Webhook's URL would - triggering any workflows linked to this Webhook with the provided request information.

### Webhook Throttling

Webhook requests are limited to 100 calls in a 10-second window (or, on average, 10 per second) per webhook. If you exceed this limit, the webhook will respond with a 429 "Over rate limit, request throttled" error.
