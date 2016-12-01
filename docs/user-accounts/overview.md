# User Accounts

Users are the highest level resource in Losant. All applications and dashboards are either owned by a user or by an organization (of which users can be members). You can sign up as a new user on the <a href="https://accounts.losant.com/create-account" target="\_blank">create account page</a>.

## User Profile

Your user profile stores information like your name and email address. To view and edit this information, click your name on the top right of the screen and select `Settings` under `My Account`. You will be redirected to the `Profile` tab.

![Profile](/images/user-accounts/profile.png "Profile")

## Change Password

You can change your password at any time on the `Change Password` tab. You will need to provide your current password and the new password. If you forgot your password and cannot login, navigate to the <a href="https://accounts.losant.com/forgot-password" target="\_blank">forgot password page</a>.

![Reset Password](/images/user-accounts/reset-password.png "Reset Password")

## Two-Factor Authentication (2FA)

Losant's two-factor authentication protects your account against unauthorized access even in the event your password has been compromised.

To use Losant's two-factor authentication you must have a mobile/desktop application that supports the open [TOTP](https://tools.ietf.org/html/rfc6238) standard. Google Authenticator is available for both [Android](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2 "Google Authenticator - Android") and [iOS](https://itunes.apple.com/us/app/google-authenticator/id388497605?mt=8 "Google Authenticator - iOS"). Another excellent application for managing TOTP accounts is [Authy](https://www.authy.com/app/) which has both mobile and desktop clients.

### Enabling Two-Factor Authentication

Navigate to the `Two-Factor Auth`, and the click the `Enable Two-Factor Authentication ...` button.

![Enable Two-Factor Auth](/images/user-accounts/enable-2fa.png "Enable Two-Factor Auth")

Use your favorite 2FA app like Google Authenticator to scan the QR code. The app will then start generating short-lived, one-time use codes. Type the code displayed within your app into the `Two-Factor Code` field in your Losant account settings. Enter your Losant password and click `Enable Two Factor Auth`. If the code expires before you click the button, you will have to enter the new code dispayed within your app.

![Verify Two-Factor Auth](/images/user-accounts/verify-2fa.png "Verify Two-Factor Auth")

### Signing In with Two-Factor Authentication

Open the two-factor authentication app used in the verification process and select the Losant account. Enter the generated one-time use code into the `Two Factor Code` field along with your username and password.

![Signin Two-Factor Auth](/images/user-accounts/signin-2fa.png "Signin Two-Factor Auth")

### Disabling two-Factor Authentication

To disable two-factor authentication, navigate to the `Two Factor Auth` tab under `Account Settings` and authenticate yourself using your password and two-factor code, then click `Disable Two Factor Auth`.

![Disable Two-Factor Auth](/images/user-accounts/disable-2fa.png "Disable Two-Factor Auth")

## Linked Accounts

Losant allows users to connect third-party accounts for use within the Losant Platform.

### Linking an Account

To link a third-party account, navigate to the `Account Links` tab. Here, you can view the list of available connections and any third-party services your account is already connected to. Click the `Connect` button next to the service you would like to connect to.

![Connect Linked Account](/images/user-accounts/connect-linked-accounts.png "Connect Linked Account")

Complete any authorization or approval needed by the third party.

![Authorize Linked Account](/images/user-accounts/authorize-linked-accounts.png "Authorize Linked Account")

### Disconnecting a Linked Account

Simply click the `Disconnect` link next to your linked account.

![Disconnect Linked Account](/images/user-accounts/disconnect-linked-accounts.png "Disconnect Linked Account")
