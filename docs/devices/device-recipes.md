---
description: Learn about how device recipes can give you the power to create devices in bulk for your Losant application.
---

# Device Recipes

A device recipe is a template (or 'recipe') for creating devices. If you have many devices that are the same or very similar, you can use device recipes to make creating those devices much easier.

Device recipes can be found under `Device Recipes` in your application's navigation.

![Device Recipe Overview](/images/devices/device-recipe-overview.png "Device Recipe Overview")

## Adding a Device Recipe

From the Device Recipes page, click the "Add Device Recipe" button in the top right corner.

![Add Device Recipe](/images/devices/add-device-recipe.png "Add Device Recipe")

## Device Recipe Configuration

A device recipe requires a name, and you may optionally provide a description of the recipe. Beyond that, all of the settings and fields that are available when [creating or editing a device](/devices/overview/#device-configuration) are also available when creating or editing a device recipe.

When creating a recipe, you may either import a previously [exported recipe](#recipe-import-export), or you may manually configure the device settings. If taking the latter path, you will be able to configure the recipe's finer details after choosing a name and initially creating the recipe.

![Device Recipe Creation Mode](/images/devices/device-recipe-creation-mode.png "Device Recipe Creation Mode")

A device created from a recipe copies all of the properties and configuration of the recipe to the new device being created. One additional tag will be added to the new device - a tag with the name `DeviceRecipe` and the value being the name of the recipe used to create this device. You can remove or modify this tag if desired, it is only added to help with device organization.

**NOTE:** Modifying a device recipe does *not* modify devices previously created using that recipe. A recipe acts as a template only; once a device is created, it is an independent item with no actual link back to recipe used to create it.

## Recipe Import / Export

Recipes can be exported and saved to a file using the "Export" button on the recipe edit page. Exported recipes can then be imported when creating a new recipe (instead of creating a recipe from scratch). This can be useful for sharing recipes with other users (or even just sharing recipes across applications).

## Using A Recipe

There are two main ways to create a device using a device recipe - single device creation and bulk device creation.

### Single Device Creation

To create a single device using a recipe, you can just add a device normally, and choose the recipe you desire to use as the template.

![Single Device Creation](/images/devices/recipe-creation-single.png "Single Device Creation")

This will fill in the standard new device form with the defaults from the chosen recipe, and you can modify those values however you would like before actually creating the new device.

### Bulk Device Creation

To create many devices at once using a device recipe, you will want to use bulk creation - which is available as an option next to each recipe on the device recipe listing page. If the number of devices you are creating is more than 750 then instead of navigating to a page with a table of the output of the generation, you will receive an email with a link to download a CSV with the results of the generation. This CSV contains the same fields as the results page shown below.

![Bulk Device Link](/images/devices/bulk-create-devices-button.png "Bulk Device Link")

There are two choices when bulk creating devices. The simplest is just choosing a number of devices to create straight from the selected template.

![Bulk Device Simple Creation](/images/devices/bulk-create-simple.png "Bulk Device Simple Creation")

When using this option, the devices will be created as exact copies of the template - except for the name of the device, which will get an incrementing number on the end of the name to allow differentiation of the created devices.

The second choice when bulk creating is to upload a CSV file of device information to use when creating devices. When you choose to upload a CSV, Losant will show a preview of what will happen when the devices are bulk created.

![Bulk Device CSV Creation](/images/devices/bulk-create-csv.png "Bulk Device CSV Creation")

CSVs are expected to have a header row, and then all subsequent rows represent devices to create. You can optionally choose what column represents the names for the new devices - if you don't, the default name from the recipe will be used (with an auto incrementing value appended). You can also optionally choose a column that represents the descriptions for the new devices (and if you don't choose one, the description in the recipe will be used). All other columns are treated as device tags - the name of the column (the header) is treated as the tag key, and the values in the column are treated as the tag values for the devices. If you leave cells blank in a tag column, that tag will not be set for that device row. You can also override tags already provided by the recipe by naming a column the same as the tag key in the recipe (and if you leave values in such a column blank, the default tag value from the recipe will be used). You cannot manipulate device *attributes* with CSV bulk creation - the device attributes are always directly copied from the template with no modifications.

The above screenshot is showing what would happen with the import of the following CSV file:

```csv
name,description,location,board
Widget Alpha,Device For Bob,Texas,
,,,Plain ESP8266
Widget 2.0,,Cincy,Plain ESP8266
```

You also have the option of creating a unique [access key](/applications/access-keys/) for each device as part of creation. If you check this box, the result of the bulk creation contain a a newly generated access key and corresponding secret for each created device.

After bulk device creation (in both the simple or the CSV case) you will be presented with a table of the created device information, along with the option to download the created device information as a CSV file. The resulting information will include all of the information from the original CSV, plus any blank cells filled in with the values actually used for that device (such as generated device names, etc..). In addition, there is a `losantDeviceId` column added, which holds the ids of the newly created devices. If there are any errors in creating any of the devices, those errors will be in a special `creationErrors` column of the result - if that column is blank, then the device for that row was created successfully.

![Bulk Device Result](/images/devices/bulk-create-result.png "Bulk Device Result")

In the above example result, all 3 devices were created successfully. The `creationErrors` column is blank for all three devices, and all three have a `losantDeviceId`. You can also see how the name was auto-generated for the second device as `Builder Kit Widget 0000`, and the `board` tag was filled in with the default recipe value for the first device. Finally, because we choose to create a unique key and secret for each device, there are `losantDeviceKey` and `losantDeviceSecret` columns with the key and secret for each device it its respective row.
