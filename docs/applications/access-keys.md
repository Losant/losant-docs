# Access Keys

To connect your devices to the Losant Platform, you must use a set of security credentials called access keys. Access keys consist of a generated key and secret pair. An access key can be used to authenticate multiple devices in an application or multiple access keys can be created to scope your devices into virtual security groups.

## Viewing Access Keys

You can view the the access keys for an application by choosing `Security` in the Application menu bar, and then clicking `Device Access Keys` in the left navigation.

![Access Keys](/images/applications/access-keys.png "Access Keys")

## Generating an Access Key

Access keys can be added to your application by using the `Add Access Key` button on the `Device Access Keys` page.

![Add Access Key](/images/applications/generate-key.png "Add Access Key")

You can choose to either make this access key valid for use by any device in this application, or restrict it to work for only a subset of devices. A restricted key will only be usable for authentication by the devices you define, and any device authenticated using a restricted key will only be able to see other devices that are in that same restricted scope. Restrictions can be specified as a comma-separated list of device IDs and tags. Tags are specified using "key=value" pairs. For more information device IDs and tags read about [Device Queries](/devices/device-queries/ "Device Queries").

![Define Access Restrictions](/images/applications/access-restrictions.png "Define Access Restrictions")

After clicking `Create Access Key`, the newly generated key and secret will be displayed. You will either need to copy your key and secret to a secure location or download them to a file on your computer.

__IMPORTANT__: Losant does not store key secrets and they cannot be recovered or regenerated if lost. If you fail to save your key secret before closing the window, you will have to generate a new access key / secret pair.

After you've saved your access key and secret, check the `I have copied my app secret to a safe place` box and click `Close Window`.

![Access Key Generated](/images/applications/access-key-generated.png "Access Key Generated")

## Deleting / Deactivating an Access Key

To temporarily deactivate an access key ...

* Click the checkbox alongside the access key in the list view, OR
* From the access key's detail page, select the "Inactive" radio button under the "Status" label and save the key.

![Delete Key](/images/applications/delete-key.png "Delete Key")

If an access key is no longer needed, or you believe it has been compromised, you may permanently delete it by:

* Clicking on the `Delete` icon in the access key list, OR
* Clicking the `Delete Access Key` button on the access key's detail page

## Using Access Keys

To find out more on using access keys with our MQTT clients, checkout the various [Losant MQTT](/mqtt/overview/) client libraries. To learn more about using access keys with our REST API, checkout the various [Losant REST](/rest-api/overview/) client libraries.
