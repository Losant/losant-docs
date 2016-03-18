# Access Keys

To connect your devices to the Structure Platform, you must use a set of security credentials called access keys. Access keys consist of a generated key and secret pair. An access key can be used to authenticate multiple devices in an application or multiple access keys can be created to scope your devices into virtual security groups.

## Viewing Access Keys

You can view the available access keys in the `Access Keys` item under the `More` menu.

![Access Keys](/images/applications/access-keys.png "Access Keys")

## Generating an Access Key

Access keys can be added to your application by using the `Generate Key` on the `Access Keys` page.

![Generate Key](/images/applications/generate-key.png "Generate Key")

You can choose to either make this access key valid for use by any device in this application, or restrict it to work for only a subset of devices. A restricted key will only be usable for authentication by the devices you define, and any device authenticated using a restricted key will only be able to see other devices that are in that same restricted scope. Restrictions can be specified as a comma-separated list of device IDs and tags. Tags are specified using "key=value" pairs. For more information device IDs and tags read about [Device Queries](/devices/device-queries/ "Device Queries").

![Define Access Restrictions](/images/applications/access-restrictions.png "Define Access Restrictions")

After clicking `Create Access Key`, the newly generated key and secret will be displayed. <u>__IMPORTANT__: Structure does not store key secrets and they can not be recovered or regenerated if lost.</u>

After you save your key and secret in a safe and secure place, check the `I have copied my app secret to a safe place` box and click `Close Window`.

![Access Key Generated](/images/applications/access-key-generated.png "Access Key Generated")

## Deleting an Access Key

If you think an access key has been compromised or is no longer needed, you may delete it by clicking on the `delete` button in the access key list.

![Delete Key](/images/applications/delete-key.png "Delete Key")

## Using Access Keys

To find out more on using access keys with our SDKs, checkout the [Structure JS SDK](https://github.com/GetStructure/structure-sdk-js) or the [Structure Arduino SDK](https://github.com/GetStructure/structure-sdk-arduino).

For information on connecting to the Structure Platform via MQTT take a look at the [Structure MQTT Documentation](/mqtt/overview).
