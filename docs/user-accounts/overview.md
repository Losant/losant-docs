# User Accounts

Users are the highest level resource in Losant. All applications and dashboards are either owned by a user or by an organization (of which users can be members). You can sign up as a new user on the <a href="https://accounts.losant.com/create-account" target="_blank">create account page</a>.

## User Profile

Your user profile stores information like your name and email address. To view and edit this information, click your name on the top right of the screen and select `Account Settings`. Once in the settings page, click the `User Profile` tab.

![Profile](/images/user-accounts/profile.png "Profile")

## Change Password

Once logged in, you can change your password at any time by providing it on the `Change Password` tab in your user settings. If you forgot your password and cannot login, navigate to the <a href="https://accounts.losant.com/forgot-password" target="_blank">forgot password page</a>.

![Reset Password](/images/user-accounts/reset-password.png "Reset Password")

## Two-Factor Authentication

Losant's 2-factor authentication protects your account against unauthorized access even in the event your password has been compromised.

To use Losant's 2-factor authentication you must have a mobile/desktop application that supports the open [TOTP](http://tools.ietf.org/html/rfc6238) standard. Google Authenticator is available for both [Android](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2 "Google Authenticator - Android") and [iOS](https://itunes.apple.com/us/app/google-authenticator/id388497605?mt=8 "Google Authenticator - iOS"). Another excellent application for managing TOTP accounts is [Authy](https://www.authy.com/app/) which has both mobile and desktop clients.

### Enabling 2-Factor Authentication

Navigate to your `Account Settings` by clicking your name in the top right of the Losant application and selecting `Account Settings` in the dropdown. Then select the `Two Factor Auth` tab.

![View 2-Factor Auth](/images/user-accounts/view-2fa.png "View 2-Factor Auth")

Click the `Enable Two-Factor Authentication ...` button.

![Enable 2-Factor Auth](/images/user-accounts/enable-2fa.png "Enable 2-Factor Auth")

Use your favorite 2-factor authentication app like Google Authenticator to scan the QR code. The app will then start generating short-lived one-time use passwords. Type the current code generated in the app into the `Two-Factor Code` field in your Losant account settings. Enter your Losant password and click `Enable Two Factor Auth`.

![Verify 2-Factor Auth](/images/user-accounts/verify-2fa.png "Verify 2-Factor Auth")

### Signing In with 2-Factor Authentication

Open the 2-factor authentication app used in the verification process and select the Losant account. Enter the generated one-time use code into the `Two Factor Code` field along with your username and password.

![Signin 2-Factor Auth](/images/user-accounts/signin-2fa.png "Signin 2-Factor Auth")

### Disabling 2-Factor Authentication

To disable 2-factor authentication, navigate to the `Two Factor Auth` tab under `Account Settings` and authenticate yourself using your password and 2-factor code, then click `Disable Two Factor Auth`.

![Disable 2-Factor Auth](/images/user-accounts/disable-2fa.png "Disable 2-Factor Auth")

## Linked Accounts

Losant allows users to connect third-party accounts for use within the Losant Platform.

### View Linked Accounts

Currently linked accounts are available by clicking your name in the top right of the Losant application and selecting `Account Settings` in the dropdown. Then select the `Account Links` tab.

![View Linked Accounts](/images/user-accounts/view-linked-accounts.png "View Linked Accounts")

### Linking an Account

To link a third-party account, click the `connect` button next to the service you would like to connect.

![Connect Linked Account](/images/user-accounts/connect-linked-accounts.png "Connect Linked Account")

Complete any authorization or approval needed by the third-party.

![Authorize Linked Account](/images/user-accounts/authorize-linked-accounts.png "Authorize Linked Account")

### Disconnecting a Linked Account

Simply click the `disconnect` link next to your linked account.

![Disconnect Linked Account](/images/user-accounts/disconnect-linked-accounts.png "Disconnect Linked Account")
