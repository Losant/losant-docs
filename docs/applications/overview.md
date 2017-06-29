# Applications

All [devices](/devices/overview/) and [workflows](/workflows/overview/) belong to a single application. Users can have multiple applications as needed. [Dashboards](/dashboards/overview/) do not belong to an application since a single dashboard can contain graphs and blocks for several different applications.

## Creating Applications

There are a few places within the platform from which an application can be created; or, applications can be created at any time using the main `Applications` menu.

![Create Application](/images/applications/create-application.png "Create Application")

When creating an application, you will be asked for three pieces of information:

-   **Application Name:** You are required to name your new application. The name can be changed at any time.
-   **Description:** Optionally, you may also provide a more detailed description of the application.
-   **Owner:** The application must be scoped to your personal [Sandbox](/user-accounts/sandbox/) or to an [organization](/organizations/overview/) for which you have the [Editor role](/organizations/members/#member-roles). The owner can be changed at a later date only if you have Administrator permissions for the parent organization (or Sandbox).

![Create Application Form](/images/applications/create-application-form.png "Create Application Form")

## Deleting Applications

Applications can be deleted on the settings page. Deleting an application cannot be undone. All devices, device data, workflows, and device recipes owned by this application will be permanently removed.

![Delete Application](/images/applications/delete-application.png "Delete Application")

## Communication Log

The Communication Log is a real-time log that will display helpful information about various aspects of your Losant Application. It's most useful for debugging purposes. 

![Communication Log](/images/applications/communication-log-full.png "Communication Log")

As a real-time tool, the Communication Log will always begin in an empty state.

![Communication Log](/images/applications/communication-log-empty.png "Communication Log")

Logs will appear as actions on your Application take place. Logs will show for the following cases:

### MQTT
- MQTT Authentication - A log will appear when an [MQTT client](https://docs.losant.com/mqtt/overview/) successfully connects or fails to connect to the [Losant MQTT broker](https://docs.losant.com/mqtt/overview/). 
- Raw MQTT Messages - MQTT Messages sent or received by the [Losant MQTT broker](https://docs.losant.com/mqtt/overview/) will appear in the log. 

### Device
- Device State - When [devices](https://docs.losant.com/devices/overview/) report [state](https://docs.losant.com/devices/state/), a log will appear.
- Device Commands - When Losant [sends a device command](https://docs.losant.com/devices/commands/), a log will appear.
- Device Connection Status - When [devices](https://docs.losant.com/devices/overview/) successfully connect or disconnect from Losant, a log will appear.

### Webooks
- Webhooks - When a [Webhook](https://docs.losant.com/applications/webhooks/) is triggered, a log will appear. 
- Webhook Replies - When [Losant](https://docs.losant.com/workflows/outputs/webhook-reply/) [replies to a Webhook](https://docs.losant.com/applications/webhooks/#custom-replies), a log will appear. 

### Endpoints

- Endpoint - When a request is made to a Losant [Experience Endpoint](https://docs.losant.com/experiences/endpoints/), a log will appear. 
- Endpoint Reply - When [Losant replies](https://docs.losant.com/workflows/outputs/endpoint-reply/) to an [Experience Endpoint](https://docs.losant.com/experiences/endpoints/), a log will appear.

### Integrations
- Integration Messages - When Losant receives a message from an [Integration](https://docs.losant.com/applications/integrations/), a log will appear. 


