flowclass: Cloud
flowclass: Edge 1.1.0
description: Learn more about the Losant Generate ID Node.

# Generate ID

The Generate ID Node allows you to generate IDs in [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier), [Object ID](https://docs.mongodb.com/manual/reference/method/ObjectId/), or [Nano ID](https://alex7kom.github.io/nano-nanoid-cc/) format and add them to your payload.

![Generate ID Node](/images/workflows/logic/generate-id.png "Generate ID Node")

## Configuration

There are at least two required fields of the configuration for this node ...
* **ID TYPE:** (Required) Choose an ID type
  * UUID V1
  * UUID V3
  * UUID V4
  * UUID V5
  * Object ID
  * Nano ID
* **Destination Path:** (Required) A path to store the generated ID on the payload, e.g. `data.ID`

### Extra Fields

UUID V3, UUID V5 and Nano Id all have extra configuration fields.

#### [UUID V3 & UUID V5](https://en.wikipedia.org/wiki/Universally_unique_identifier#Versions_3_and_5_(namespace_name-based)) Extra Options

* **Namespace Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) that is a UUID to use as the namespace for the hashing to create the UUID.
* **Value Template:** (Required) A string template combined with the namespace to create a hash to use to make the new UUID.

#### Nano ID

* **Number of Characters:** (Optional) A string template for setting the length of the generate ID. By default, an ID of 21 characters will be given if this is not specified. This number *must* be greater than 0 and less than 256.

![Generate ID Node Configuration](/images/workflows/logic/generate-id-configuration.png "Generate ID Node Configuration")
