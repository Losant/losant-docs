description: Learn more about installing the Losant Edge Agent.

# Losant Edge Agent Installation

The Losant Edge Agent ("Agent") is a command line utility exposed through [Docker](https://www.docker.com/what-docker) as a [container](https://www.docker.com/what-container) you can run on your [Edge Compute Device](/devices/edge-compute/). The below focuses on installing the Agent on a device running Ubuntu, but the Agent can be run on any device that can run Docker. While the expectation is that you'll be running on an IoT style device, the Agent can be run on OSX and Windows as well. See the Edge Compute Device documentation for additional information on [supported devices](/devices/edge-compute/#supported-devices) and [minimum requirements](/devices/edge-compute/#minimum-requirements).

## Setting Up Your OS

The following installation takes place on `Ubuntu 16.04.4 LTS`. First, you'll need to make sure your packages are up to date.

```console
sudo apt-get update
```

## Installing The Docker Repository

For more information on any of the following steps, please see the Docker documentation for [installing Docker on Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/). You can also find specific instructions for your particular OS.

Before installing Docker, it is recommended to install the Docker repository. The first step is to allow `apt` to use a repository over HTTPS:

```console
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Add Docker’s official GPG key:

```console
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`, by searching for the last 8 characters of the fingerprint:

```console
sudo apt-key fingerprint 0EBFCD88
```

Use the following command to set up the stable repository:

```console
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## Installing Docker

Now we're ready to install Docker itself. Let's make sure our packages are up to date again:

```console
sudo apt-get update
```

Finally, we're ready to install the latest version of Docker. You may decide that you want a specific version of Docker, see the [Docker documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/) for more details.

```console
sudo apt-get install docker-ce
```

Verify that we have successfully installed Docker:

```console
sudo docker run hello-world
```

## Getting The Losant Edge Agent

At this point, you have a working Docker Daemon running in the background on your device and are ready to "pull" the `losant/edge-agent` from Docker Hub. The following architectures are supported and the proper image will be delivered to you based on your device/OS: `amd64`, `arm`, `arm64`. Again, the Agent runs as a Docker Container and therefore comes with everything it needs to run on your system. You don't need to install anything else on your device to run the Agent.

When a new release is cut, a new image will be built and tagged. It is recommended that you pick a specific version of the Agent by specifying a tag after the image: `losant/edge-agent:1.0.0`. If you are unsure which version to use, you can also use `latest` or omit the tag altogether and `latest` will be pulled for you.

```console
sudo docker pull losant/edge-agent
```

That's it! Everything should be installed and ready to go. To verify, the best way is to start using the Agent. If you're unsure how to run the Agent, you can continue on to the [documentation for usage](/edge-compute/edge-agent-usage/).

## (Optional) Executing the Docker Command Without Sudo

By default, you'll have to run `docker` with the `sudo` command as you see above. If you wish to omit typing `sudo`, you'll need to add your username to the `docker` group which was created when Docker was installed. After doing so, you'll need to log out and back in. Then, you can verify that `docker` is in the outputted list.

```console
sudo usermod -aG docker ${USER}
sudo su - ${USER}
id -nG
```

If you see "Error loading config ... permission denied" errors when trying to run containers, you'll need to update the permissions on your `.docker` directory.

```console
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R
```
