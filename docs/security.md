# Losant Security Overview

Losant's platform ensures the highest degree of security possible for a customer's connected solution. Losant makes use of industry-standard encryption mechanisms to fully encrypt all data during transit and while at rest. This document provides a detailed overview of the practices used to provide a completely secure environment for users and applications.

![Security](/images/security-diagram.png "Security")

## Transport Security

All communication between devices and Losant is fully encrypted using TLS. TLS is widely adopted and available on most embedded devices, languages, and operating systems. TLS is an industry-standard encryption scheme and most commonly used by browsers to encrypt https data.

## API Security Tokens

API access is controlled by the industry-standard [JSON Web Tokens](https://tools.ietf.org/html/rfc7519) authentication mechanism. Remote API access tokens are created by users through the account dashboard. The types of resources available to the token can be individually controlled depending on the needs of the specific API client. For example, an application that just needs access to view data can generate a token that only grants access to data. This token would not be able to view, edit, or manage any information about workflows or devices. API access tokens can be revoked at any time.

Losant does not store the tokens once they are generated. It is up to the user to securely save this information. There is no way to recover a token if it is lost. The scope of each token is securely encrypted directly into the token, which is decrypted by Losant server-side. This allows Losant to use the token to grant access to resources without having to store any information about the token directly. The benefit of this approach is that access tokens can never by obtained from any data stored on Losant's servers.

## Application Secret and Keys

Devices that communicate using MQTT make use of application secrets and keys. These are implemented in the same way as API Security Tokens, but automatically scope access to the specific application. The key and secret are used as MQTT's username and password fields respectively.

## Infrastructure Security

Losant uses [Google Compute](https://cloud.google.com) as the underlying infrastructure provider. All data is stored using Google Compute Engine's [persistent disk](https://cloud.google.com/compute/docs/disks/#pd_encryption) functionality, which encrypts all data in transit and at rest. Google complies to the strictest of information and physical security requirements. Please refer to their [security documentation](https://cloud.google.com/security/) for full details.

## 2-Factor Authentication

Losant has implemented a 2-Factor Authentication scheme based on the [Internet Engineering Task Force](http://ietf.org/) standard [RFC 6238](https://tools.ietf.org/html/rfc6238). The same time-variant based one-time password algorithm used by Google and Amazon also protects a Losant user's account against unauthorized access even if their password has been compromised.
