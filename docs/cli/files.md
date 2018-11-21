description: Manages your Losant Application's Files from the command line.

# Files

Manages your Losant Application's [Files](/applications/files/) from the command line. On download your files directory, inside the directory configured for the Losant CLI, will reflect the same directory structure as seen in the UI. To create new files locally, add them to the files directory. If you add the file in a nested directory where the directories do not exist remotely, those will automatically be added when uploading that file. To remove a file locally, simply remove it, and then run the upload command.

## Commands

You have three main commands for files: download, status, and upload. If you ever need help just run `losant files --help`, and all of your options will print out. Same for any command below, e.g. `losant files upload --help`.

### Download

Usage: `losant files download [options] [pattern]`

The download command is used to download your files and to resolve conflicts between your local files and your Application's (remote) files. To start a download run `losant files download`.

Download has the following options:

- `-f, --force` force all changes by ignoring modification checking
- `--dry-run` display actions but do not perform them

![Download Files](/images/cli/files-download-success.png "Files Download Success")

If you have conflicts (which can be seen when running `losant files status`) when you try to download you can resolve your conflicts. When a conflict is detected for a file you will be prompted to choose one of three options. They are the following:

- `Do nothing, and resolve the conflict later.` - resolve the conflicts yourself meaning you will update both the remote and your local copy to get back into a non-conflicting state.
- `Overwrite with the remote data.` - use the data from the remote files
- `Ignore the remote data.` - use your data from your local files

![Download Resolve Conflicts](/images/cli/files-download-conflicts.png "Files Download Resolve Conflicts")

![Download Resolved Conflicts](/images/cli/files-download-resolved.png "Files Download Resolved Conflicts")

### Status

Usage: `losant files status`

The status command prints a table for each files indicating the status locally, remotely and whether they are conflicting. This command will tell you if you have added files locally, or you need to download new files from your Application, or any modifications have been made to a view either locally or remotely.

![Files Status](/images/cli/files-status.png "Files Status")

### Upload

Usage: `losant files upload [options] [pattern]`

The upload command pushes any changes from your local files to the remote files. If you run this command and any uploads are found to be in conflict (unless the force option is set) that will halt the upload until conflicts are fixed.

Upload has the following options:

- `-f, --force` force all changes by ignoring modification checking
- `--dry-run` display actions but do not perform them

![Upload Files](/images/cli/files-upload-success.png "Files Upload Success")
