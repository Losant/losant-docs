---
flowclass:
  - Edge 1.5.0
description: Learn more about the Losant Redis Trigger.
---

# Redis Trigger

The Redis Trigger will trigger a workflow whenever the [Edge Compute device](/devices/edge-compute/) receives a message on the configured Redis pub/sub channel.

![Redis Trigger](/images/workflows/triggers/redis-trigger.png "Redis Trigger")

## Configuration

There are two sections of configuration for a Redis trigger. First, you need to configure what Redis server to connect to. You are required to provide the Redis hostname, and you may optionally provide the Redis port and password. If you don't provide a port, it defaults to the standard Redis port of `6379`. If you don't provide a password, it defaults to no password. Once you have the information configured for the Redis connection, you then must configure the particular Redis channel or channel pattern to subscribe to.

## Payload

The payload will include information about the message and the triggering channel/pattern. If you are just subscribing to a specific channel, the `channel` and `pattern` fields will be identical. If you have subscribed to a channel pattern, the `pattern` field will be the pattern you subscribed to, and the `channel` field will the particular channel the message arrived on:

```json
{
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "data": {
    "message": <the redis message>,
    "pattern": <the pattern subscribed to>,
    "channel": <the specific channel for this message>
  },
  "deviceId": <id of the edge device>,
  "deviceName": <the edge device name>,
  "deviceTags": {<any tags for the edge device>},
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "flowVersion": <name of the current workflow version>,
  "globals": <object of workflow globals>,
  "isConnectedToLosant": <if the agent is connected to Losant>,
  "agentEnvironment": <object of environment variables>,
  "time": <time the message arrived>,
  "triggerId": <id of the redis trigger>,
  "triggerType": "redis"
}
```
