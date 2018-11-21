description: Manage your Losant Application and it's resources on your local disk.

# Losant CLI

Losant CLI is a command line tool to help manage your Losant [Application](/applications/overview/) and its resources. It easily lets you manage [Experience Views](/experiences/views/), [Experience Versions](/experiences/versions/), and [Files](/applications/files/) in your Applications.

## Installation

The Losant CLI requires you to download and install Node.js version 8.3 or higher and NPM. You can use the [Node installer](https://nodejs.org/en/download/) to install both Node and NPM. Once you have those installed, run `npm install -g losant-cli`. To check that you have install Losant ClI properly run `losant --help`, and that will print all of the commands you have available. See our [GitHub repository](https://github.com/Losant/losant-cli) if you are having trouble installing.

## Set Up Commands

### Login

The first command that you need to run after install the Losant CLI is `losant login`.

![Losant Login](/images/cli/login.png "Login")

This will prompt you to enter your Losant Email, Password and Two Factor Authentication. Your email and password is required, to complete the login. If you **do not** have two factor authentication enabled, just hit enter to skip two factor authentication. Once you have successfully authenticated with our API, a file will be created at `~/.losant/.credentials.yml` containing your authentication token. This token will be used across all of your Losant configured directories.

![Losant Success Login](/images/cli/login-success.png "Login Success")

If for some reason authentication fails, you will be able to try again, right away.

![Losant Retry Login](/images/cli/login-failure.png "Login Retry")

### Configure

After you have run the `losant login` command successfully, you are now ready to configure a directory. Create or go to a directory that you want to keep your Losant Application resources, then run `losant configure`. This will link the current directory to one of your Losant Applications.

![Losant Configure](/images/cli/configure.png "Configure")

When you run this command, you will be prompted to give a (or part of) Losant Application Name. If multiple Applications come back with similar names we will present you with a list to choose from, if you don't find the application you are looking for choose `none of these, search again`, and it will re-prompt you for another Application name. Once you have picked the Losant Application, it will automatically try to download your Application's [Experience Views](/experiences/views/). It will then prompt you to download your [Application's Files](/applications/files/).

![Losant Configure Success](/images/cli/configure-success.png "Configure Success")

Once you have configured the directory you will notice a few newly created directories in your configured directory.

#### Losant CLI Directories

- `.losant/` - this is where we store dot files with your YAML configuration
- `experience/components/` - this is where all of you local experience components will be.
- `experience/pages/`  - this is where all of you local experience pages will be.
- `experience/layouts/`  - this is where all of you local experience layouts will be.
- `files/`  - this is where all of you local files will be. The Files directory will match the top level directory on your Application's [Files](/applications/files/), e.g. if on Losant you have a file at `/foo/bar/helloworld.txt` that file will be downloaded and placed at `files/foo/bar/helloworld.txt`.
