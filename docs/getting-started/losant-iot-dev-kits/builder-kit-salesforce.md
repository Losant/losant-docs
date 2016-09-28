# Losant Salesforce Builder Kit Instructions

The Losant Salesforce Builder Kit</a> is an easy way to get up and running with the Losant IoT developer platform and <a href="https://www.salesforce.com/products/service-cloud/overview/" target="_blank">Salesforce Service Cloud</a>. This kit provides all the hardware and software needed to build a few simple projects that cover a wide variety of the features within the Losant platform.

![Builder Kit](/images/getting-started/losant-iot-dev-kits/builder-kit-nodemcu/kit-complete.jpg "Builder Kit")

## Overview

The device we're building in this workshop contains a button and an LED. When the button is pressed, a <a href="https://help.salesforce.com/apex/HTViewHelpDoc?id=cases_home.htm&language=en_US" target="_blank">Salesforce Case</a> will be created. The LED will be controlled by the number of open cases. If there are any open cases, the LED will be lit. If there are no open cases, the LED will be off. This device provides a quick way to create new cases and an easy way to visualize whether or not there are open cases that need to be addressed.

## 1. Build the Device

// TODO: combine the button and led wiring instructions into one step.

## 2. Salesforce Setup

If you haven't already, sign up for a <a href="https://developer.salesforce.com" target="_blank">Salesforce developer account</a>.

The screenshots in this workshop are using Salesforce's new Lightning Experience. You can enabled the Lightning Experience by first clicking the Lightning Experience menu item on the left.

![Lightning Menu](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/lightning-menu.jpg "Lightning Menu")

Next, scroll to the bottom and enable Lightning Experience.

![Enable Lightning](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/enable-lightning.jpg "Enable Lightning")

The last step is to click your name in the top-right corner and select "Switch to Lightning Experience".

![Switch to Lightning](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/switch-to-lightning.jpg "Switch to Lightning")

## 3. How to get Salesforce Security Token

In order to integrate with Salesforce, we're going to need a security token. You can get this through your account settings. First, click your account icon in the top-right corner and select "Settings".

![Account Settings](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/account-settings.jpg "Account Settings")

Next, in the Quick Search field on the left, type "Reset" to find the option to reset your token.

![Find Reset Token](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/find-reset-token.jpg "Find Reset Token")

Lastly, click the "Reset Security Token" button.

![Reset Token](/images/getting-started/losant-iot-dev-kits/builder-kit-salesforce/reset-token.jpg "Reset Token")

Once complete, Salesforce will send you the security token via email. This token will be used in later steps to invoke the Salesforce API to create cases when the button is pressed.
