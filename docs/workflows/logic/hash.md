flowclass: Application
flowclass: Experience
flowclass: Edge 1.1.0
description: Learn more about the Losant Hash Node.

# Hash

The Hash Node allows you to create a [cryptographic hash](https://en.wikipedia.org/wiki/Cryptographic_hash_function) and put it on your payload.

![Hash Node](/images/workflows/logic/hash.png "Hash Node")

## Configuration

The Hash Node's configuration fields are:

* **Data Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) that is the input data (or message) used to create the hash.
* **Secret Template:** When provided, will create an [HMAC](https://en.wikipedia.org/wiki/HMAC), which signs this secret in hash.
* **Algorithm Type:** (Required) The algorithm that is used to generate the hash. Options are:

    * [MD5](https://en.wikipedia.org/wiki/MD5)
    * [RIPEMD](https://en.wikipedia.org/wiki/RIPEMD)
    * [SHA1](https://en.wikipedia.org/wiki/SHA-1)
    * [SHA256](https://en.wikipedia.org/wiki/SHA-2) (Default)
    * [SHA512](https://en.wikipedia.org/wiki/SHA-2)
    * [Whirlpool](https://en.wikipedia.org/wiki/Whirlpool_(cryptography))

* **Encoding Type:** (Required) The encoding the digest message should be formatted in. Options are:

    * [Base64](https://en.wikipedia.org/wiki/Base64)
    * [Hex](https://en.wikipedia.org/wiki/Hexadecimal) (Default)
    * [Latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1)

* **Destination Path:** (Required) A path to store the hash on the payload, e.g. `data.hash`

![Hash Node Configuration](/images/workflows/logic/hash-configuration.png "Hash Node Configuration")
