description: Learn more about running and using the Losant Edge Agent.

# Losant Edge Agent Usage

The Losant Edge Agent ("Agent") is a command line utility exposed through [Docker](https://www.docker.com/what-docker) as a [container](https://www.docker.com/what-container) you can run on your [Edge Compute Device](/devices/edge-compute/). The below outlines some example usage for how you can interact with the Agent on your device. For full documentation of all available flags and options, see the [`losant/edge-agent` image on Docker Hub](https://hub.docker.com/r/losant/edge-agent/).

For help getting the Agent setup on your device, see the [installation instructions](/edge-compute/edge-agent-installation/). All command examples below assume you can run `docker` without `sudo` or that you are logged in as `root` (not recommended). If you wish to run `docker` as your current user, see [these instructions](/edge-compute/edge-agent-installation/#optional-executing-the-docker-command-without-sudo).

## Creating Storage Area

It is **strongly** recommended that you mount a volume in to the Agent as a workspace for persistent data. By default, the Agent will write data **inside** the container to `/data`. By [mounting a volume or using a volume container](https://docs.docker.com/storage/volumes/), we can have the Agent write to a local folder on the Edge Compute Device. An important benefit to this being that you have access to the persistent data created by the Agent and thus, containers can be destroyed and created without losing the data created at run time. Another benefit is that the Agent doesn't accumulate data internally which could impact the performance and/or stability of the container.

All we need to do is create a folder locally to house the data. This folder can be anywhere on your filesystem, so long as permissions are set so `docker` can write to it. For instance, you might choose to put this folder at `~/losant-edge-agent` for easy access. For this example, we're going to create a folder at `/var/lib/losant-edge-agent/` and update the permissions to allow `docker` to write to it.

```console
sudo mkdir -p /var/lib/losant-edge-agent/data
sudo chmod a+rwx -R /var/lib/losant-edge-agent
```

## Running With Environment Config

There are only three required environment variables that must be set to run the container. You must provide the `DEVICE_ID` obtained when you [created your edge compute device](/devices/edge-compute/), as well as the `ACCESS_KEY` and `ACCESS_SECRET` [associated with your application](/applications/access-keys/). Although these are the only required configuration, we're also going to mount in a volume for the Agent to write to.

```console
docker run -d --name docs-agent \
  -e 'DEVICE_ID=<your-device-id>' \
  -e 'ACCESS_KEY=<your-access-key>' \
  -e 'ACCESS_SECRET=<your-access-secret>' \
  -v /var/lib/losant-edge-agent/data:/data \
  losant/edge-agent
```

Let's break this down a little bit. By specifying the `-d` parameter to `docker run`, we are asking the Agent to run in the background so we have control of our terminal after running the Agent. The `--name` option allows us to name our container so that we may stop and start it more easily in the future. The `-e` allows us to enumerate any and all environment variables we would like to pass in as configuration. Lastly, the `-v` flag tells `docker run` that we would like to mount our host folder `/var/lib/losant-edge-agent/data` as `/data` inside the container. Note, by specifying an image `losant/edge-agent` without a tag, we are asking for the `latest` tag of the Agent. It is recommended that you select a version- `losant/edge-agent:1.0.0` for example.

## Managing The Edge Agent

Before we move on to more advanced ways of configuring the Agent, let's quickly talk about how to manage it once it's running. If you're familiar with Docker, you can skip this section.

In general, the `docker --help` information is very useful for familiarizing yourself with the commands. Below, we're going to cover some basic management commands. A few of which, we've already started using. Let's recap those plus some additional ones that should allow you to get up and running for basic use cases.

**> `docker run [-d] [--rm] [--name] [-e] [-v] <image-name>` ([more info](https://docs.docker.com/engine/reference/commandline/container_run/))**

This command allows us to configure a container from a base image. In our case, `losant/edge-agent`. We've talked about most of the above options in this document as we've been using the Agent. The only one not mentioned elsewhere is the `--rm` flag, which will tell docker to destroy the container after it has been stopped/killed. This is useful as you work to figure out your final configuration. There are, of course, many more flags you can use with `docker run`.

**> `docker logs [-f] <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_logs/))**

This command allows us to look at the console output of the Agent after it has been started and is running. Unless you are writing your Agent logs to a file, this is the primary way you'll get a glimpse into what the Agent has been doing.

**> `docker ps -a` ([more info](https://docs.docker.com/engine/reference/commandline/ps/))**

This command will output all containers that have been created on your host whether they are running or not. This is useful for getting the container id of your Agent after it has been started. It is also useful for getting the container id of a stopped container so that you may restart it.

**> `docker stop <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_stop/))**

You can stop a running Agent container that is running in the background using the `stop` command. This will simply stop the container, but not destroy it. All your environment configuration and any other flags used when running `docker run` will be preserved when starting again.

**> `docker kill <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_kill/))**

If the Agent container isn't responding to a `container stop` command, you may need to `kill` the container. This will forcefully exit the container and could cause unexpected behavior on future runs of the Agent.

**> `docker start <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_start/))**

After stopping a container, you can restart it using the `start` command. This will preserve all configuration that was entered when running `docker run`.

**> `docker restart <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_restart/))**

Instead of running `docker stop` and then `docker start`, you can simply run `docker restart`.

**> `docker rm <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_rm/))**

It's a good practice to name your containers on your Edge Compute Device to prevent many containers being created and taking up space on your device. Because of this practice, you'll need to remove your container before creating another with the same name. Or, you can create a container with a different name as you determine the best way to run the Agent on your device.

### Agent Management Example

With these basic `docker` commands, we can manage our running agent. Note, this example shows how to remove a container and will destroy the container we have running permanently. You would need to create another container from the image if you do so.

```console
$ docker logs docs-agent
0000-00-00T00:00:00.000Z [info] Agent Starting...
0000-00-00T00:00:00.000Z [info] Connecting to: mqtts://broker.losant.com...
0000-00-00T00:00:00.000Z [info] Webserver started on port: 8080
0000-00-00T00:00:00.000Z [info] Workflows initialized and running...
0000-00-00T00:00:00.000Z [info] Connected to mqtts://broker.losant.com
$ docker ps -a
CONTAINER ID   IMAGE                     COMMAND                   CREATED         STATUS        PORTS     NAMES
51aff3e4b650   losant/edge-agent:latest  "/opt/losant/tini -g..."  30 minutes ago  Up 5 minutes  8080/tcp  docs-agent
$ docker stop docs-agent
docs-agent
$ docker start docs-agent
docs-agent
$ docker kill docs-agent
docs-agent
$ docker ps -a
CONTAINER ID   IMAGE                     COMMAND                   CREATED         STATUS        PORTS     NAMES
51aff3e4b650   losant/edge-agent:latest  "/opt/losant/tini -g..."  31 minutes ago  Exited                  docs-agent
$ docker rm docs-agent
docs-agent
$ docker ps -a
CONTAINER ID   IMAGE                     COMMAND                   CREATED         STATUS        PORTS     NAMES
```

## Running With A Configuration File

The Losant Edge Agent has many configuration options, see the official [Docker Hub Repo](https://hub.docker.com/r/losant/edge-agent/) for a full list and advanced configuration. Because of the robust configuration options, you can configure the Agent via a [toml formatted](https://github.com/toml-lang/toml) configuration file. In addition to using a configuration file for this example, we're also going to configure the Agent to log to a file. See the section below for a full example configuration file.

### Configuration File Example

Let's create a configuration file in the directory we created earlier. Here's our `/var/lib/losant-edge-agent/config.toml` file. I'm using `vim` to create the configuration file, but any editor is fine.

```console
sudo vim /var/lib/losant-edge-agent/config.toml
```

```toml
[logger]
out = '/data/losant-edge-agent-log.log'
level = 'verbose'

[gateway]
id = '<your-device-id>'
key = '<your-access-key>'
secret = '<your-access-secret>'

[store]
path = '/data/losant-edge-agent-store.db'
```

Notice that we are designating the logger to output to the same `/data` directory within the container that the store is writing to. This allows us to just mount a local folder on our host to the `/data` directory in the Agent container and have all persistent data written to a single place. Now we can run the Agent container without specifying environment variables, and instead simply provide the path to our `config.toml`.

```console
docker run -d --name docs-agent \
  -v /var/lib/losant-edge-agent/data:/data \
  -v /var/lib/losant-edge-agent/config.toml:/etc/losant/losant-edge-agent-config.toml \
  losant/edge-agent
```

`/etc/losant/losant-edge-agent-config.toml` is the default location for the `toml` configuration file inside the container, so we mount our local configuration to that location in the container. Now that our Agent container is running, we can see the output by watching the log file we specified with `logger.out`:

```console
$ tail -f /var/lib/losant-edge-agent/data/losant-edge-agent-log.log
0000-00-00T00:00:00.000Z [info] Agent Starting...
0000-00-00T00:00:00.000Z [info] Connecting to: mqtts://broker.losant.com...
0000-00-00T00:00:00.000Z [info] Webserver started on port: 8080
0000-00-00T00:00:00.000Z [info] Workflows initialized and running...
0000-00-00T00:00:00.000Z [info] Connected to mqtts://broker.losant.com
```

### Making Changes To The Config File

Because we have designated a configuration file and configured our Agent container to read from it, making changes are easy. Let's say we decide that `verbose` logging is just too much logging and we only really care about `error` level logs. We can simply modify our `/var/lib/losant-edge-agent/config.toml` like so:

```toml
# ...
[logger]
out = '/data/losant-edge-agent-log.log'
level = 'error'
# ...
```

Then restart the Agent to have the Agent pick up our new configuration changes.

```console
docker restart docs-agent
```

### Webserver: HTTP Request Trigger / HTTP Response Node

If you wish to enable the [HTTP Request trigger](/workflows/triggers/request/) for your Edge Compute Device, you can do so by binding a host port at the time of container creation. Building on the configuration we have going, we only need to add the `-p` flag and then configure the Agent in our configuration file to enable the trigger. See [exposing ports](https://docs.docker.com/engine/reference/commandline/run/#publish-or-expose-port--p-expose) with Docker for more information. For more advanced configuration of the [HTTP Request trigger](/workflows/triggers/request/) and [HTTP Response Node](/workflows/outputs/http-response/), see the [Docker Hub Repo](https://hub.docker.com/r/losant/edge-agent/).

```console
docker run -d --name docs-agent \
  -v /var/lib/losant-edge-agent/data:/data \
  -v /var/lib/losant-edge-agent/config.toml:/etc/losant/losant-edge-agent-config.toml \
  -p 8080:8080
  losant/edge-agent
```

```toml
# ...
[webserver]
enable = true
```

## Agent Configuration Options

### All Options

As seen above, you can configure the Agent with the following options. If you set an option in both places, the environment variable will override the configuration file. For additional information the [Docker Hub Repo](https://hub.docker.com/r/losant/edge-agent/).

| Environment Variable        | Configuration File Option       |
| --------------------------- | ------------------------------- |
| `CONF_PATH`                 | N/A                             |
| `DEVICE_ID`                 | `gateway.id`                    |
| `ACCESS_KEY`                | `gateway.key`                   |
| `ACCESS_SECRET`             | `gateway.secret`                |
| `LOGGER_OUT`                | `logger.out`                    |
| `LOGGER_LEVEL`              | `logger.level`                  |
| `STORE_PATH`                | `store.path`                    |
| `WEBSERVER_ENABLED`         | `webserver.enabled`             |
| `WEBSERVER_PORT`            | `webserver.port`                |
| `WEBSERVER_ADDRESS`         | `webserver.address`             |
| `WEBSERVER_USERNAME`        | `webserver.username`            |
| `WEBSERVER_PASSWORD`        | `webserver.password`            |
| `WEBSERVER_SSL_KEY_PATH`    | `webserver.ssl.keyPath`         |
| `WEBSERVER_SSL_KEY`         | N/A                             |
| `WEBSERVER_SSL_CERT_PATH`   | `webserver.ssl.certificatePath` |
| `WEBSERVER_SSL_CERT`        | N/A                             |
| `WEBSERVER_SSL_BUNDLE_PATH` | `webserver.ssl.bundlePath`      |
| `WEBSERVER_SSL_BUNDLE`      | N/A                             |

### Example Configuration File

```toml
# Losant Edge Agent Configuration File
#
# Any configuration variables that are commented out
# below have defaults and are not required.

[logger]
# Desired logger output destination - EnvVar: LOGGER_OUT
# out = 'console'

# Desired level of logging - EnvVar: LOGGER_LEVEL
# level = 'info'

[gateway]
# Losant Device ID of Agent - EnvVar: DEVICE_ID
id = ''

# Losant Access Key for Agent - EnvVar: ACCESS_KEY
key = ''

# Losant Access Secret for Agent - EnvVar: ACCESS_SECRET
secret = ''

[store]
# Path to Agent Persistent Store - EnvVar: STORE_PATH
# path = '/data/losant-edge-agent-store.db'

[webserver]
# If webserver should be enabled - EnvVar: WEBSERVER_ENABLED
# enabled = true

# Port to run webserver on - EnvVar: WEBSERVER_PORT
# port = 8080

# Address to run webserver on - EnvVar: WEBSERVER_ADDRESS
# address = '0.0.0.0'

# Basic auth username for webserver - EnvVar: WEBSERVER_USERNAME
# username = ''

# Basic auth password for webserver - EnvVar: WEBSERVER_PASSWORD
# password = ''

[webserver.ssl]
# NOTE if an SSL key is provided, an SSL certificate is
# also required, and vice versa. An SSL bundle is optional.

# Path to the SSL Key file to use for the webserver - EnvVar: WEBSERVER_SSL_KEY_PATH
# Key can also be provided directly using the EnvVar WEBSERVER_SSL_KEY
# keyPath = ''

# Path to the SSL Certificate file to use for the webserver - EnvVar: WEBSERVER_SSL_CERT_PATH
# Certificate can also be provided directly using the EnvVar WEBSERVER_SSL_CERT
# certificatePath = ''

# Path to the SSL Bundle file to use for the webserver - EnvVar: WEBSERVER_SSL_BUNDLE_PATH
# Bundle can also be provided directly using the EnvVar WEBSERVER_SSL_BUNDLE
# bundlePath = ''
```
