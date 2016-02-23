# User Accounts

## Two-Factor Authentication

Structure's 2-factor authentication protects your account against unauthorized access even in the event your password has been compromised.

To use Structure's 2-factor authentication you must have a mobile/desktop application that supports the open [TOTP](http://tools.ietf.org/html/rfc6238) standard. Google Authenticator is available for both [Android](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2 "Google Authenticator - Android") and [iOS](https://itunes.apple.com/us/app/google-authenticator/id388497605?mt=8 "Google Authenticator - iOS"). Another excellent application for managing TOTP accounts is [Authy](https://www.authy.com/app/) which has both mobile and desktop clients.

### Enabling 2-Factor Authentication

Navigate to your `Account Settings` by clicking your name in the top right of the Structure application and selecting `Account Settings` in the dropdown. Then select the `Two Factor Auth` tab.

![View 2-Factor Auth](/images/user-accounts/view-2fa.png "View 2-Factor Auth")

Click the `Enable Two-Factor Authentication ...` button.

![Enable 2-Factor Auth](/images/user-accounts/enable-2fa.png "Enable 2-Factor Auth")

Use your favorite 2-factor authentication app like Google Authenticator to scan the QR code. The app will then start generating short-lived one-time use passwords. Type the current code generated in the app into the `Two-Factor Code` field in your Structure account settings. Enter your Structure password and click `Enable Two Factor Auth`.

![Verify 2-Factor Auth](/images/user-accounts/verify-2fa.png "Verify 2-Factor Auth")

### Signing In with 2-Factor Authentication

Open the 2-factor authentication app used in the verification process and select the Structure account. Enter the generated one-time use code into the `Two Factor Code` field along with your username and password.

![Signin 2-Factor Auth](/images/user-accounts/signin-2fa.png "Signin 2-Factor Auth")

### Disabling 2-Factor Authentication

To disable 2-factor authentication, navigate to the `Two Factor Auth` tab under `Account Settings` and authenticate yourself using your password and 2-factor code, then click `Disable Two Factor Auth`.

![Disable 2-Factor Auth](/images/user-accounts/disable-2fa.png "Disable 2-Factor Auth")

## Linked Accounts

Structure allows users to connect third-party accounts for use within the Structure Platform. For example to send a tweet from a workflow, you must first have a connected Twitter account.

For an example on how linked accounts can be used, check out the [Tweet Workflow Node](/workflows/outputs/tweet/) documentation.

### View Linked Accounts

Currently linked accounts are available by clicking your name in the top right of the Structure application and selecting `Account Settings` in the dropdown. Then select the `Account Links` tab.

![View Linked Accounts](/images/user-accounts/view-linked-accounts.png "View Linked Accounts")

### Linking an Account

To link a third-party account, click the `connect` button next to the service you would like to connect.

![Connect Linked Account](/images/user-accounts/connect-linked-accounts.png "Connect Linked Account")

Complete any authorization or approval needed by the third-party.

![Authorize Linked Account](/images/user-accounts/authorize-linked-accounts.png "Authorize Linked Account")

### Disconnecting a Linked Account

Simply click the `disconnect` link next to your linked account.

![Disconnect Linked Account](/images/user-accounts/disconnect-linked-accounts.png "Disconnect Linked Account")
