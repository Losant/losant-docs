# Redis

The Redis node allows a workflow to query or update values in a [Redis](http://redis.io/) database and optionally store the result on the workflow payload.

![Redis Node](/images/workflows/data/redis-node.png "Redis Node")

## Configuration

The configuration of the Redis node can be broken down into 4 major sections - configuring the connection, choosing the operation, setting up the arguments, and choosing what to do with the result.

![Redis Node Connection Configuration](/images/workflows/data/redis-node-connection.png "Redis Node Connection Configuration")

When configuring the connection, you must provide the hostname where your Redis instance is running. You can also optionally provide the Redis port, if your Redis is running on a non-standard port (default is 6379), and you can provide the Redis database number if you are not using the default database 0. In addition, if your Redis instance is password-protected, you can provide the password needed to connect. All four of these fields support [string templates](/workflows/accessing-payload-data/#string-templates), and so can be configured with values from the current workflow payload.  In the example above, the Redis node has been configured to connect to database `0` at `myredis.example.com` on port 6379 with the password `myRedisPassword`.

![Redis Node Command](/images/workflows/data/redis-node-command.png "Redis Node Command")

Next you will need to choose the command that will be performed on the Redis database. The Redis node has support for most regular Redis commands that deal with keys, sets, sorted sets, hashes, lists, strings, geo, hyperloglog, and publishing. The node does not support cluster, connection, scripting, subscribing, or server command groups. Depending on what command you choose, the next section of configuration will change - due to the expected number of arguments differing per command.  In the example above, the node is configured to perform a `hget` operation.

![Redis Node Arguments](/images/workflows/data/redis-node-arguments.png "Redis Node Arguments")

Depending on the chosen command, the expected arguments here will change.  For example,
with the `hget` operation, there are two arguments - the key representing the hash, and the field to get within that hash. In the above example, the key that will be queried is `phone_contacts`, and the particular field in the key depends on the `triggerId` that triggered the workflow to run.  All arguments support [string templates](/workflows/accessing-payload-data/#string-templates).  For commands that have optional or arbitrary numbers of arguments, the node will let you provide as many arguments as you need.

![Redis Node Result](/images/workflows/data/redis-node-result.png "Redis Node Result")

Finally, you can optionally choose to store the result of the Redis operation on the payload at a given [payload path](/workflows/accessing-payload-data/#payload-paths).  For operations like `set` or `sadd`, you might not care about the result, but for an operation like the `hget` above, you almost certainly do! In this case the result of the `hget` is being placed at the JSON path `data.redisResult`. Here is an example payload after the above Redis workflow node has been run:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {
    "current": 10,
    "on": true,
    "redisResult": "212 867-5309"
  },
  "applicationId": "568beedeb436ab01007be53d",
  "applicationName": "Embree",
  "triggerId": "56c8967bb8df0f0100d629120",
  "triggerType": "deviceId",
  "deviceTags": {
    "floor": ["2"],
    "location": ["warehouse1"]
  },
  "deviceName": "My Factory Device",
  "flowId": "56c74add04d0b50100043381",
  "flowName": "Power Usage Alert",
  "globals": { }
}
```
