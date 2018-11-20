description: Manages your Losant Application's Experience Views, and Versions from the command line.

# Experience

Manages your Losant Application's [Experience Views](/experiences/views), and [Versions](/experiences/versions) from the command line. To create new views locally, add them to the appropriate view type directory, e.g. add a new page in `experiences/pages/` directory and the CLI will find them. If you want to remove a view then delete the file from your local directory.

## Commands

You have four main commands for experiences: download, status, upload, and version. If you are ever need help just run `losant experience --help`, and all of your options will print out. Same for any command below, e.g. `losant experience upload --help`.

### Download

Usage: `losant experience download [options] [pattern]`

The download command is used to download your experience and to resolve conflicts between your local experience views and your Application's (remote) experience views. When you download a view the name of the file is the name of the view. To start a download run `losant experience download`. The pattern is to limit the download by matching on the name of the views, e.g. 'error\*' means download an experience view who's name begins with error. 

Download has the following options:

- `-f, --force` force all changes by ignoring modification checking
- `--dry-run` display actions but do not perform them
- `--type <viewType>` the type of experience view you want to upload e.g. layouts, pages or components

![Download Experience](/images/cli/exp-download-success.png "Experience Download Success")

If you have conflicts, which can be seen when running `losant experience status` and you try to download you can resolve your conflicts. When a conflict is detected for a file you will be prompted to choose one of three options. They are the following: 

- `Do nothing, and resolve the conflict later.` - resolve the conflicts yourself meaning you will update both the remote and your local copy to get back into a non-conflicting state.
- `Overwrite with the remote data.` - use the data from the remote experience view
- `Ignore the remote data.` - use your data from your local experience view

![Download Resolve Conflicts](/images/cli/exp-download-conflicts.png "Experience Download Resolve Conflicts")

![Download Resolved Conflicts](/images/cli/exp-download-resolved.png "Experience Download Resolved Conflicts")

## Status

Usage: `losant experience status`

The status command prints a table for each experience view indicating the status locally, remotely and whether they are conflicting. This command will tell you if you have added views locally, or you need to download new views from your Application, or any modifications have been made to a view either locally or remotely.

![Experience Status](/images/cli/exp-status.png "Experience Status")

### Upload

Usage: `losant experience upload [options] [pattern]`

The upload command pushes any changes from your local experience views to the remote experience views. If you run this command and any uploads are found to be in conflict (unless the force option is set) that will halt the upload until conflicts are fixed.

Upload has the following options:

- `-f, --force` force all changes by ignoring modification checking
- `--dry-run` display actions but do not perform them
- `--type <viewType>` the type of experience view you want to upload e.g. layouts, pages or components

![Upload Experience](/images/cli/exp-upload-success.png "Experience Upload Success")

### Version

Usage: `losant experience version <name>`

The version command can be used to either list your commands or create a new one.

If you run `losant experience version` it will print a list of all your current versions, and the domains that are pointed to that version.

![Version List](/images/cli/exp-version-list.png "Experience Version List")

If you run `losant experience version v1.0.0`, then it will try to create a new version with the name `v1.0.0` and you will be prompted to choose domains and endpoint slugs that you want to point to that new version.

![Version List](/images/cli/exp-version-create.png "Experience Version Create")
