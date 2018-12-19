---
description: Manages your Losant Application's Experience Views, and Versions from the command line.
---

# Experience

Manages your Losant Application's [Experience Views](/experiences/views/), and [Versions](/experiences/versions/) from the command line. To create new views locally, add them to the appropriate view type directory, e.g. add a new page in `experiences/pages/` directory and the CLI will find them. If you want to remove a view then delete the file from your local directory.

## Commands

You have four main commands for experiences: download, status, upload, and version. If you ever need help just run `losant experience --help`, and all of your options will print out. Same for any command below, e.g. `losant experience upload --help`.

### Download

Usage: `losant experience download [options] [pattern]`

The download command is used to download your experience and to resolve conflicts between your local experience views and your Application's (remote) experience views. When you download a view the name of the file is the name of the view. To start a download run `losant experience download`. The pattern options allows you to limit the download by matching on the name of the views, e.g. 'error\*' means download an experience view who's name begins with error.

Download has the following options:

- `-f, --force` force all changes by ignoring modification checking
- `--dry-run` display actions but do not perform them
- `--type <viewType>` the type of experience view you want to download e.g. layouts, pages or components

![Download Experience](/images/cli/exp-download-success.png "Experience Download Success")

If you have conflicts (which can be seen when running `losant experience status`) when you try to download you can resolve your conflicts. When a conflict is detected for a file you will be prompted to choose one of three options. They are the following:

- `Do nothing, and resolve the conflict later.` - resolve the conflicts yourself meaning you will update both the remote and your local copy to get back into a non-conflicting state.
- `Overwrite with the remote data.` - use the data from the remote experience view
- `Ignore the remote data.` - use your data from your local experience view

![Download Resolve Conflicts](/images/cli/exp-download-conflicts.png "Experience Download Resolve Conflicts")

![Download Resolved Conflicts](/images/cli/exp-download-resolved.png "Experience Download Resolved Conflicts")

### Status

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

Usage: `losant experience version [options] <name>`

The version command can be used to either list your versions or create a new version.

Version has the following options:

- `-l, --list <pattern>` this filters which versions will be printed, by only printing ones that match this glob e.g. `v1.2.*`
- `-d, --description <description>` when creating a new version you can set the description of that version by passing in this option.

If you run `losant experience version` it will print a list of all your current versions, and the domains or slugs that are pointed to that version.

![Version List](/images/cli/exp-version-list.png "Experience Version List")

If you run `losant experience version v1.0.0`, then it will try to create a new version with the name `v1.0.0` and you will be prompted to choose domains and slugs that you want to point to that new version.

![Version List](/images/cli/exp-version-create.png "Experience Version Create")

### Bootstrap

Usage: `losant experience bootstrap`

The bootstrap command will build starter layouts, routes, workflows, users and user groups to get you started on your Experience. You can only bootstrap your Experience once.

If you run `losant experience bootstrap`, it will automatically download all of your newly created views, prints out the email, and password of a generated user and gives you a link to your new Experience.

![Bootstrap](/images/cli/exp-bootstrap.png "Bootstrap")

This is also a new prompt when running the `losant configure` command. After you have selected the Application, if that Application does not have an Experience then you will have the option to bootstrap.

If you run `losant configure` and do not have an experience you will see the following:

![Bootstrap On Configure](/images/cli/exp-configure-bootstrap.png "Bootstrap On Configure")

### Layout

Usage: `losant experience layout [options] <page>`

The layout command works similar to the versions command. If no page is given it will print out a table of the pages to layouts so you can see which page belongs to which layout. If you give a page, you will be asked to select a layout to set that page as. There will be a special option called "no layout", which will unset the layout for that page(s). The page can be a glob, in order to set multiple pages to the same layout.

Layout has the one options:

- `-l --list pattern` this can be used to filter the table of pages to layouts, by only printing pages that match this glob e.g. `User*`.

When you run `losant experience layout`:

![Layout Table](/images/cli/exp-layout-table.png "Layout Table")

When you run `losant experience layout 'Home *'`

![Setting Layout](/images/cli/exp-set-layout.png "Set Layout")
