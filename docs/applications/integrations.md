# Integrations

Integrations are connections to external [MQTT brokers](http://mqtt.org/), [Pub/Sub messaging suppliers](https://cloud.google.com/pubsub/docs/overview) or other third-party web services. These connections can then be used to trigger [workflows](/workflows/overview/) and/or output messages from your application.

## Viewing Integrations

![Integrations List](/images/applications/integrations-list.png "Integrations List")

View your application's integrations under `Integrations` in the Application menu bar. Icons next to each integration indicate its last known connection status.

Click an integration's name in the list to view its configuration, make edits or view workflows associated with the integration.

## Creating an Integration

![Add Integration](/images/applications/add-integration.png "Add Integration")

From the Integrations list page, click "Add Integration" in the top right corner. This will take you to a page where the new integration can be configured.

## Integration Settings

![Integration Common Config](/images/applications/integration-config-common.png "Integration Common Config")

Every integration requires a **name**, and you may also disable the integration by unchecking the **Enabled** checkbox. When editing an existing integration, you may also re-check its connection status from the settings page if you have [editor permissions](/organizations/members/#member-roles) for the application.

Beyond that, the configuration for an integration varies wildly depending on its type.

### MQTT

Setting up an MQTT broker integration allows you to [trigger workflows](/workflows/triggers/mqtt/) whenever the integration receives a message; it also allows you to [publish messages](/workflows/outputs/mqtt/) to the broker via a workflow.

There are a number of properties that must be defined when setting up the integration.

![Integration MQTT Config](/images/applications/integration-mqtt-config.png "Integration MQTT Config")

* **Protocol, Host and Port:** Select `mqtt://`, `mqtts://`, `ws://` or `wss://` for the **protocol**. The **port number** will change to the default port for each of these protocols, but you may change this if necessary. For the **host**, enter the domain at which the broker is accessed.
* **Clean:** Leave this checked to clear any previous session when connecting to the broker; uncheck it to pick up previous session data if it exists.
* **Client ID:** Enter a client ID if the broker requires one. If you leave this field blank, Losant will automatically assign a client ID, which you may change at any time.
* **Authentication Method:** There are three options to choose from, some of which require additional fields to be entered ...
    * **None:** Provide no authentication information to the broker.
    * **Username and password:** Authenticate with the broker by providing a `Username` and a `Password`. This is the default authentication method.
    * **Certificate:** If a secure protocol is selected  (`mqtts://` or `wss://`), you can choose to authenticate by certificate, in which case you must provide a `Private Key` and a `Certificate`.  
* **Topics:** Enter one or more topics to subscribe to from this broker. Any workflows [triggering](/workflows/triggers/mqtt/) off of this integration will fire anytime a message is received on one of these topics. (Note: It is not necessary to subscribe to a topic in order to publish to it in an [MQTT Output Node](/workflows/outputs/mqtt/).)
* **CA Certificate:** If you selected a secure protocol for the connection, you will have the option to enter your own CA certificate. If you use a self-signed certificate or a certificate from a non-standard authority, you must provide the CA certificate from the authority so Losant can properly verify the connection.

### Google Pub/Sub

A [Google Cloud Pub/Sub](https://cloud.google.com/pubsub/docs/) integration allows you to [trigger workflows](/workflows/triggers/google-pub-sub/) off of messages going through your messaging middleware. It also allows you to [publish](/workflows/outputs/google-pub-sub/) to the service via a workflow.

There are three properties that must be defined when setting up the integration.

![Integration Google Pub/Sub Config](/images/applications/integration-google-config.png "Integration Google Pub/Sub Config")

* **Project ID:** This is the [ID](https://support.google.com/cloud/answer/6158840) of your Google Cloud Platform project.
* **Configuration:** A JSON object in the format of a [Service Account Key](https://cloud.google.com/iam/docs/creating-managing-service-account-keys). (The key must have Editor permissions.)
* **Topics:** Enter one or more topics to subscribe to. Any workflows [triggering](/workflows/triggers/google-pub-sub/) off of this integration will fire anytime a message is received on one of these topics. (Note: It is not necessary to subscribe to a topic in order to publish to it in an [Google Pub/Sub Output Node](/workflows/outputs/google-pub-sub/).)

## Deleting an Integration

An integration can be deleted by clicking the "Delete" icon next to any user on the list page, or by clicking the "Delete" button in the footer of a user's edit page. Deleting a user will automatically remove him / her from any of their [Experience Groups](/experiences/groups/).

![Delete Integration](/images/applications/delete-integration.png "Delete Integration")

When deleting an integration, you also have the option of deleting any [workflows](/workflows/overview/) triggered by that integration. Note that this action deletes **any workflow with a trigger matching this integration**. If you wish to save your workflows and change out their triggers, or if the workflows are triggered by multiple conditions and you wish to retain them, you should leave this option unchecked.
