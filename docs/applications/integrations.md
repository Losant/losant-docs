---
description: Learn about to subscribe to external services in Losant.
---

# Integrations

Integrations are connections to external [MQTT brokers](http://mqtt.org/), [Pub/Sub messaging suppliers](https://cloud.google.com/pubsub/docs/overview) or other third-party web services. These connections can then be used to trigger [workflows](/workflows/overview/) and/or output messages from your application.

## Examples & Tutorials

* <a href="https://www.losant.com/blog/how-to-integrate-particle-with-losant" target="_blank">How to Integrate Particle with Losant</a>
* <a href="https://www.losant.com/blog/getting-started-with-azure-iot-and-losant" target="_blank">Getting Started with Azure IoT and Losant</a>
* <a href="https://www.losant.com/blog/getting-started-with-aws-iot-and-losant" target="_blank">Getting Started with AWS IoT and Losant</a>
* <a href="https://www.losant.com/blog/getting-started-with-google-pub-sub-and-losant" target="_blank">Getting Started with Google Pub/Sub IoT and Losant</a>

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

* **Protocol, Host and Port:** Select `mqtt://`, `mqtts://`, `ws://` or `wss://` for the **protocol**. The **port number** will update to the default port for each of these protocols, but you may change this if necessary. For the **host**, enter the domain at which the broker is accessed.
* **Clean:** Leave this checked to clear any previous session when connecting to the broker; uncheck it to pick up previous session data if it exists.
* **Client ID:** Enter a client ID if the broker requires one. If you leave this field blank, Losant will automatically assign a client ID, which you may change at any time.
* **Authentication Method:** There are three options to choose from, some of which require additional fields to be entered ...
    * **None:** Provide no authentication information to the broker.
    * **Username and password:** Authenticate with the broker by providing a `Username` and a `Password`. This is the default authentication method.
    * **Certificate:** If a secure protocol is selected (`mqtts://` or `wss://`), you can choose to authenticate by certificate, in which case you must provide a `Private Key` and a `Certificate`.
* **Topics:** Enter one or more topics to subscribe to from this broker. Any workflows [triggering](/workflows/triggers/mqtt/) off of this integration will fire anytime a message is received on one of these topics. *(Note: It is not necessary to subscribe to a topic in order to publish to it in an [MQTT Output Node](/workflows/outputs/mqtt/).)*
* **CA Certificate:** If you selected a secure protocol for the connection, you will have the option to enter your own CA certificate. If you use a self-signed certificate or a certificate from a non-standard authority, you must provide the CA certificate from the authority so Losant can properly verify the connection.

### Google Pub/Sub

A [Google Cloud Pub/Sub](https://cloud.google.com/pubsub/docs/) integration allows you to [trigger workflows](/workflows/triggers/google-pub-sub/) off of messages going through your messaging middleware. It also allows you to [publish](/workflows/outputs/google-pub-sub/) to the service via a workflow.

There are three properties that must be defined when setting up the integration.

![Integration Google Pub/Sub Config](/images/applications/integration-google-config.png "Integration Google Pub/Sub Config")

* **Project ID:** This is the [ID](https://support.google.com/cloud/answer/6158840) of your Google Cloud Platform project.
* **Configuration:** A JSON object in the format of a [Service Account Key](https://cloud.google.com/iam/docs/creating-managing-service-account-keys). There are a few validation rules on the object's properties; it is recommended you copy the key directly from your Google Cloud account and paste it here. *Note: The key should have the Pub/Sub Editor role - roles/pubsub.editor - because it needs to be able to create subscriptions.*
* **Topics:** Enter one or more topics to subscribe to. Any workflows [triggering](/workflows/triggers/google-pub-sub/) off of this integration will fire anytime a message is received on one of these topics. *Note: It is not necessary to subscribe to a topic in order to publish to it in a [Google Pub/Sub Output Node](/workflows/outputs/google-pub-sub/).*

### Particle

A [Particle](https://www.particle.io/) integration allows you to [trigger workflows](/workflows/triggers/particle/) off of events published from your Particle devices. It also allows you to call a Particle [device function](/workflows/outputs/particle-call/) and receive a response via a workflow.

There are two properties that must be defined when setting up the integration.

![Integration Particle Config](/images/applications/integration-particle-config.png "Integration Particle Config")

* **Access Token:** This is the access token that Losant will use to communicate with Particle. You can get your access token from the "Settings" view in the [Particle IDE](https://build.particle.io).
* **Event Names:** Enter one or more event names to subscribe to. Any workflows [triggering](/workflows/triggers/particle/) off of this integration will fire anytime a message is received on one of these topics. If you append a `*`, the event name will be treated as a prefix match - so any events that start with the given name will match. In addition, an event name of just `*` will subscribe to all events. *Note: It is not necessary to subscribe to an event in order to perform [device function](/workflows/outputs/particle-call/) calls.*

The other three fields in the Particle integration configuration are optional - `Device Name or ID`, `Product Slug or ID`, `Org Slug or ID`. These correspond to the `deviceId`, `product`, and `org` parameters on the underlying Particle [Event Stream](https://docs.particle.io/reference/javascript/#geteventstream) API endpoint. When the `deviceId` field is left blank, Losant will use the special keyword `mine` when connecting to Particle, to ensure that Losant only subscribes to events for your devices (as opposed to subscribing to the public events of any Particle device).

For a step-by-step walkthrough, please read the article <a href="https://www.losant.com/blog/how-to-integrate-particle-with-losant" target="_blank">How to Integrate Particle with Losant</a>.

### Meridian

A [Meridian](http://meridianapps.com/) integration allows you to [trigger workflows](/workflows/triggers/meridian/) off of asset and tag location updates published from a Meridian location.

There are two properties that must be defined when setting up the integration.

![Integration Meridian Config](/images/applications/integration-meridian-config.png "Integration Meridian Config")

* **Authentication Token:** This is the authentication token that Losant will use to communicate with Meridian. You can create an authentication token from the "Application Tokens" screen in the Meridian interface for a location.
* **Meridian Location ID:** This is the Meridian location ID associated with the authentication token.

The other fields in the Meridian integration are optional, and help you to filter down the exact Meridian messages that Losant should listen to. `Subscribe to Zone Updates` tells the integration to subscribe to messages about assets entering or leaving Meridian zones. `Subscribe to Asset Updates` tells the integration to subscribe to messages about the location of an asset changing. Finally, you can provide any number of `Map IDs`, which will filter messages for the location down to just those taking place in the specified maps. If no map IDs are provided, the messages will not be filtered - Losant will subscribe to updates for the entire location.

## Using Integrations

<div class="clearfix">
  <div style="float: right; max-width: 300px; margin: 0 0px 24px 10px;">
    <img style="border-width: 5px;" src="/images/applications/integration-example-workflow.png" alt="Integration Example Workflow" />
  </div>
  <p>Setting up integrations serves two purposes: triggering workflows and outputting messages. Both of these goals are accomplished using Losant's workflow engine. For more information, check out your integration's corresponding nodes:</p>
  <ul>
    <li><a href="/workflows/triggers/mqtt/">MQTT Trigger</a> and <a href="/workflows/outputs/mqtt/">MQTT Output Node</a></li>
    <li><a href="/workflows/triggers/google-pub-sub/">Google Pub/Sub Trigger</a> and <a href="/workflows/outputs/google-pub-sub/">Google Pub/Sub Output Node</a></li>
  </ul>
  <p>Messages received from your integrations count against your <a href="/organizations/resource-limits/#payload-limits">payload limits</a>, so make sure to only subscribe to topics that you are actually using.</p>
</div>

## Deleting an Integration

An integration can be deleted by clicking the "Delete" icon next to any item on the list page, or by clicking the "Delete" button in the footer of an integration's edit page.

![Delete Integration](/images/applications/delete-integration.png "Delete Integration")

When deleting an integration, you also have the option of deleting any [workflows](/workflows/overview/) triggered by that integration. Note that this action deletes **any workflow with a trigger matching this integration**. If you wish to save your workflows and change out their triggers, or if the workflows are triggered by multiple conditions and you wish to retain them, you should leave this option unchecked.
