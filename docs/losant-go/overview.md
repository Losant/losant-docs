# Losant Go App Overview

The Losant Go app works by turning your mobile phone into a Losant device. You can then trigger workflows to do any number of amazing things whenever you push the button.

## Application Setup

### Create Account

If you don't already have an account, navigate to [https://accounts.losant.com/create-account](https://accounts.losant.com/create-account) to register, or create an account through the app.

<div class="slim-image-container"><img src="/images/losant-go/sign-up-link.png" alt="Create Account Link" title="Create Account Link" /><img src="/images/losant-go/sign-up-screen.png" alt="Auto Setup Option" title="Auto Setup Option" /></div>

### Auto Setup

Select "Auto Setup" and Losant will automatically create a new application, device, and empty workflow that are immediately ready to use.

<div class="slim-image-container"><img src="/images/losant-go/auto-setup-button.png" alt="Auto Setup Button" title="Auto Setup Button" /></div>

Auto Setup automatically creates the following:

1. Application: Losant Go Mobile App
2. Workflow: Losant Mobile Workflow
3. Device: Losant Button with the attribute "buttonPressed" (Number), and location (GPS String)

<div class="slim-image-container"><img src="/images/losant-go/auto-setup-complete.png" alt="Auto Setup Complete" title="Auto Setup Complete" /></div>

Your mobile device is now set up. You'll just need to login to [https://app.losant.com](https://app.losant.com) to configure your workflow to do something useful.  View [workflows](/workflows/overview/) for more details.  Read [Using the Button](#using-the-button) to use the button.

### Manual Setup

Advanced users can choose Manual Setup to select a pre-existing application and device that you'd like this mobile phone to represent. Your device must have the attributes, "buttonPressed" (Number) and location (GPS String), in order to use it effectively.

*1. Select manual setup*

<div class="slim-image-container"><img src="/images/losant-go/manual-setup-link.png" alt="Manual Setup Option" title="Manual Setup Option" /></div>

*2. Choose application*

<div class="slim-image-container"><img src="/images/losant-go/select-application.png" alt="Select Application" title="Select Application" /></div>

*3. Select device to use as button*

<div class="slim-image-container"><img src="/images/losant-go/select-device.png" alt="Select Device" title="Select Device" /></div>

## Using the Button

Tap the Losant Go button to use it.  If the button has successfully communicated with the Losant platform, you will receive a "Success" message on your button.

There is an optional switch under the button that will allow you to send your current gps coordinates.

<div class="slim-image-container"><img src="/images/losant-go/go-button.png" alt="Go Button" title="Go Button" /><img src="/images/losant-go/go-button-success.png" alt="Success" title="Success" /></div>

The Losant Go App sends the state "buttonPressed = 1" and your current gps coordinates (optional) to the Losant platform each time the button is pressed.  By default, the button will not do anything except log your payload to a debugging panel. You can view the button activity in Losant by viewing the debug panel.

If your device does not have the attributes "buttonPressed" and "location", the Losant Go app will prompt you with an option to append those attributes to your device.

### View Debugging Data

To view the debugging data, log in to Losant, and do the following:

*1. Navigate to the Losant Go Application by clicking on "Applications" > "View all Applications".*

![View Applications](/images/losant-go/view-applications.png "View Applications")

*2. Click on "Losant Go Mobile App".*

![Losant Go Mobile App Link](/images/losant-go/losant-go-app-link.png "Losant Go Mobile App Link")

*3. Click on "Losant Mobile Workflow".*

![Losant Mobile Workflow Link](/images/losant-go/losant-mobile-workflow-link.png "Losant Mobile Workflow Link")

*4. Click the "Debug" tab on the screen.*

![Debug Tab](/images/losant-go/debug-tab.png "Debug Tab")

*5. Now, tap the go button.  You will see that it will output to the Debug panel.  It should look something like this.*

![Debug Panel](/images/losant-go/debug-panel.png "Debug Panel")

This information is called a "payload", and it is in JSON format.  We will revisit this later.

### SMS Example

Ok, let’s make your button do something.  In the following example, you will be configuring the Losant workflow to send an SMS with data from your payload.

*1. Scroll down "Node Palette" on the left side, and locate the "SMS" node. Drag it to the screen.*

![Drag SMS Node](/images/losant-go/drag-sms-node.png "Drag SMS Node")

*2. Connect the "Debug" node to the "SMS" node by dragging the bottom point of the "Debug" node to the top point of the "SMS" node.*

![Connect Debug node to SMS node](/images/losant-go/connect-debug-sms.png "Connect Debug node to SMS node")

*3. Click on the "SMS" node and enter your phone number to receive the text message.*

![Enter Phone Number](/images/losant-go/enter-phone-number.png "Enter Phone Number")

*4. In the "Message Template" box, enter the following:*

<pre>Hello, the date and time is {{ time }}.  Triggered from {{ deviceName }} at http://maps.google.com?q={{ data.location }}</pre>

![Enter Message](/images/losant-go/enter-message.png "Enter Message")

This will pull data from your payload, which was mentioned above.  You can reference data in the payload JSON using the {{ }}.

*5. Click "Deploy Workflow".*

![Click Deploy Workflow](/images/losant-go/deploy-workflow.png "Click Deploy Workflow")

*6. Now, tap on the Losant Go button again.  You should receive a text message to the phone number you entered in the previous step.*

<div class="slim-image-container"><img src="/images/losant-go/sms-message.png" alt="SMS Message" title="SMS Message" /></div>

That was just the surface of what you can do with the Losant Go App.  Using workflows with the Losant Go App, you can do many things like open up a garage door, turn on a coffee maker or control any smart device.  Read more about [workflows](/workflows/overview/).


To download the app, visit the [App Store](https://itunes.apple.com/us/app/losant-go/id1112244753?mt=8
) or [Google Play](https://play.google.com/store/apps/details?id=com.losant.goapp).

<div class="badge-image-container"><a href="https://itunes.apple.com/us/app/losant-go/id1112244753?mt=8"><img src="/images/losant-go/app-store-badge.png" alt="Download on the App Store" title="Download on the App Store" /></a><a href="https://play.google.com/store/apps/details?id=com.losant.goapp&hl=en"><img src="/images/losant-go/google-play-badge.png" alt="Get it on Google Play" title="Get it on Google Play" /></a></div>
