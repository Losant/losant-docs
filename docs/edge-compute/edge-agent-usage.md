description: Learn more about running and using the Losant Edge Agent.

# Losant Edge Agent Usage

The Losant Edge Agent ("Agent") is a command line utility exposed through Docker as a container you can run on your [Edge Compute Device](/devices/edge-compute/). The below outlines some example usage for how you can interact with the Agent on your device. For full documentation of all available flags and options, see the [`losant/edge-agent` image on Docker Hub](https://hub.docker.com/r/losant/edge-agent/).

For help getting the Agent setup on your device, see the [installation instructions](/edge-compute/edge-agent-installation/). All command examples below assume you can run `docker` without `sudo` or that you are logged in as `root` (not recommended). If you wish to run `docker` as your current user, see [these instructions](/edge-compute/edge-agent-installation/#optional-executing-the-docker-command-without-sudo).



## Creating Storage Area 

It is **strongly** recommended that you mount a volume in to the Agent as a workspace for persistent data. By default, the Agent will write data inside the container to `/data`. By [mounting a volume or using a volume container](https://docs.docker.com/storage/volumes/), we can have the Agent write to a local folder on the Edge Compute Device. An important benefit to this being that you have access to the persistent data created by the Agent and thus, containers can be destroyed and created without losing the data created at run time. Another benefit is that the Agent doesn't accumulate data internally which could impact the performance and/or stability of the container.

All we need to do is create a folder locally to house the data. This folder can be anywhere on your filesystem, so long is permissions are set so `docker` can write to it. For instance, you might choose to put this folder at `/etc/losant-edge-agent/` if you have many CLI utilities installed on your device. For this example, we're simply going to put the folder at our user's root directory and update the permissions to allow `docker` to write to it.

```console
cd ~
mkdir losant-edge-agent
chmod a+rwx -R losant-edge-agent
```


## Running With Environment Config

There are only three required environment variables that must be set to run the container. You must provide the `DEVICE_ID` obtained when you [created your edge compute device](/devices/edge-compute/), as well as the `ACCESS_KEY` and `ACCESS_SECRET` [associated with your application](/applications/access-keys/). Although these are the only required configuration, we're also going to mount in a volume for the Agent to write to (see above).

```console
docker run -d --name myAgent \
  -e 'DEVICE_ID=<your-device-id>' \
  -e 'ACCESS_KEY=<your-access-key>' \
  -e 'ACCESS_SECRET=<your-access-secret>' \
  -v /home/$USER:/data \
  losant/edge-agent
```

Let's break this down a little bit. By specifying the `-d` parameter to `docker`, we are asking the Agent to run in the background so we have control of our terminal after running the Agent. The `--name` option allows us to name our container so that we may stop and start it more easily in the future- we'll cover that shortly. The `-e` allows us to enumerate any and all environment variables we would like to pass in as configuration. Lastly, the `-v` flag tells `docker` that we would like to mount our local folder `/home/$USER` as `/data` inside the container. Note, by specifying the `losant/edge-agent` image without a tag, we are asking for the `latest` tag. It is recommended that you select a version- `losant/edge-agent:1.10.0` for example.

Once the container is running, we can inspect the output of the container by using the `docker container logs <container-id>` command as shown below. See below for more information on managing the running Agent container.



## Managing The Edge Agent

Before we move on to more advanced ways of configuring the Agent, let's quickly talk about how to manage it once it's running. If you're familiar with Docker, you can skip this section.

In general, the `docker --help` information is very useful for familiarizing yourself with the commands. Below, we're going to cover some basic management commands. A few of which, we've already started using. Let's recap those plus some additional ones that should allow you to get up and running for basic use cases.

### > `docker run [-d] [--rm] [--name] [-e] [-v] <image-name>` ([more info](https://docs.docker.com/engine/reference/commandline/container_run/))

This command allows us to configure a container from a base image. In our case, `losant/edge-agent`. We've talked about most of the above options in this document as we've been using the agent. The only one not mentioned else where is the `--rm` flag, which will tell docker to destroy the container after it has been stopped/killed. This is useful as you work to figure out your final configuration.

### > `docker container logs [-f] <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_logs/))

This command allows us to look at the console output of the Agent after it has been started and is running. Unless you are writing your Agent logs to a file, this is the primary way you'll get a glimpse into what the Agent has been doing.

### > `docker ps -a` ([more info](https://docs.docker.com/engine/reference/commandline/ps/))

This command will output all containers that have been created on your host whether they are running or not. This is useful for gettin the container id of your Agent after it has been started. It is also useful for getting the container id of a stopped container so that you may restart it.

### > `docker container stop <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_stop/))

You can stop a running Agent container that is running in the background using the `stop` command. This will simply stop the container, but not destroy it. All your environment configuration and any other flags used when running `docker run` will be preserved when starting again.

### > `docker container kill <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_kill/))

If the Agent container isn't responding to a `container stop` command, you may need to `kill` the container. This will forcefully exit the container and cause unexpected behavior on future runs of the Agent.

### > `docker container start <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_start/))

After stopping a container, you can restart it using the `start` command. This will preserve all configuration that was entered when running `docker run`.

### > `docker container rm <container-name|container-id>` ([more info](https://docs.docker.com/engine/reference/commandline/container_rm/))

It's a good practice to name your containers on your Edge Compute Device to prevent many containers being created and taking up space on your device. Because of this practice, you'll need to remove your container before creating another with the same name. Or, you can create a container with a different name as you determine the best way to run the Agent on your device.


## Running With A Configuration File

The Losant Edge Agent has many configuration options, see the official [Docker Hub Repo](https://hub.docker.com/r/losant/edge-agent/) for a full list and advanced configuration. Because of the robust configuration, you can configure the Agent via a [toml formatted](https://github.com/toml-lang/toml) configuration file. In addition to using a configuration file for this example, we're also going to configure the Agent to log to a file. See the section below for a full example configuration file, as well as. Here's our `~/losant-edge-agent/config.toml`.

```toml
# /home/$USER/losant-edge-agent/config.toml
# Losant Edge Agent Configuration File
#
# Configuration file location can be configured when running
# the agent by either the command line flag --conf-path or the
# environment variable CONF_PATH
#
# Any configuration variables that are commented out
# below have defaults and are not required.

[logger]
# Desired logger output destination - CLI: --logger-out, EnvVar: LOGGER_OUT
# out = 'console'
# level = 'verbose'
```


