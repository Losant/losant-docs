flowclass: Edge 1.2.0
description: Learn more about the Losant UDP Send Node.

# Edge UDP Send

The UDP Send Node allows an edge workflow to send a UDP datagram to a given address and port.

![UDP Send Node](/images/workflows/outputs/udp-send-node.png "UDP Send Node")

## Configuration

![UDP Send Node Configuration](/images/workflows/outputs/udp-send-node-config.png "UDP Send Node Configuration")

To configure the UDP send node, you must provide a destination and a message:

* **Host Template:** (Required) A [string template](/workflows/accessing-payload-data/#string-templates) for destination address. This can be either an IPV4 or IPV6 address, or a hostname that will resolve to an address.
* **Port Template:** (Required) A string template for destination port. This must resolve to a valid port (between 1 and 65535).
* **Message Encoding:** The encoding for the datagram (defaults to UTF8).
* **Message:** A string template for the contents of the UDP datagram to send.

## Result

![UDP Send Node Node Output](/images/workflows/outputs/udp-send-node-output.png "Run Executable Node Output")

You can optionally store the result of the UDP send on the payload for later use in the workflow. A successful UDP send will have the result `{ success: true }`. A UDP send that results in an error will have a result of the form `{ error: <error> }`.

## UDP Caveats

Due to the nature of UDP, just because a UDP send succeeds does not mean the destination received the message - all it means is the message was successfully sent. UDP has no built in guarantees around message delivery. In addition, large UDP messages (greater than 1KB) may be dropped or fragmented by intermediate systems or networks, so if you are planning to send large UDP messages, we recommend running some tests first.
