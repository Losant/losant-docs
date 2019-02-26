---
description: Learn about uploading files for use in the Losant platform.
---

# Files

Losant has built-in file management functionality to allow for uploading and referencing resources for use within your application. Files can be used to, for example, serve static resources in your [experience layouts](/experiences/views/#layouts), display a custom floorplan in the [Position Chart](/dashboards/position-chart/) or map custom pin images in the [GPS History block](/dashboards/gps-history/).

## Viewing Files

You can access all the files within an application by clicking the "Files" tab in the application menu bar.

From there, you can click a file's name to view more details, or click a [directory's](#directories) name to view its contents.

![File Details](/images/files/file-details.png "File Details")

## Uploading Files

Files can be uploaded one of two ways:

- Clicking the "Add Files" button in the top right corner of the files table. This will open your operating system's native file browser dialog, where you can one or multiple files to upload.
- Dragging files from your file system onto the table. Doing so will turn the table green to indicate that the selected files can be uploaded.

![Upload File](/images/files/upload-file.png "Upload File")

There are a couple things to keep in mind when uploading files:

- Files are uploaded to the [directory](#directories) you are currently viewing.
- Some characters in your file names may not be valid URL characters, and as a result, the URLs where you access the files after upload may be slightly different from the file's name on your file system.
- Directories on your file system cannot be uploaded. If you wish to upload the entire contents of a directory, you will have to select all the files within it and upload them.
- Each upload can support a maximum of 25 files. To upload more files than that, you will have to break the files up into chunks of 25 or fewer files and do one batch at a time.

## Directories

Optionally, you can organize your application's files into directories, which can make categorization and ongoing management easier, especially if you are managing a large number of files.

To create a directory, click the "Add Directory" button atop the files list. This will present a modal where you can enter a new directory name.

![Create New Directory](/images/files/new-directory-modal.png "Create New Directory")

If you enter a name with slashes (such as "/foo/bar/bat"), this will automatically create the directory "foo" at the root level, with a directory "bar" as a child, and the directory "bat" as a child of that.

Directories are always listed at the top of your list of files, regardless of sorting and filtering properties. To view a directory's contents, click its name, which will navigate the file browser into that directory. You will then see a list of all subdirectories and files within it. From this view, new files can be uploaded to this directory.

## Managing Files and Directories

After files have been uploaded and directories have been created, they can be renamed and moved to other locations within your application's file structure. **Note** that doing so, however, can break any places where you are currently [using](#using-files) a file or a file that is a child of the changed directory.

### Editing Files and Directories

To edit a file, click the file's name or the gear icon to bring out a detail panel. To edit a directory, you must click the gear icon as clicking the directory's name will navigate the file browser into the directory.

![Edit File](/images/files/edit-file.png "Edit File")

From the detail panel, the item can be renamed or moved to another directory. Just like with [creating a directory](#directories), moving the item to a directory with slashes in the name will create new directories for each segment down the line.

**Note**, editing a file's name or parent directory will break any links to the file that you're currently using in your application, just as if you were moving or renaming the file on a web server. Requests to any URLs of files affected by the edit will stop working after the edit is complete.

Renaming and/or moving a file is a very quick process, though there can be a few seconds of time between when the file move starts and when it is available at its new URL. Renaming or moving a directory can take a much longer time, depending on how many subdirectories and child files exist within the edited directory, as each of these items must also be moved. When a file or directory is in the process of moving, the file browser may display the old item in a "Moving" state and the new item in a "Waiting" state until the move is complete, at which point the "Moving" item will disappear from the list.

### Deleting Files and Directories

To delete a file or directory, either click the "Delete" icon in the file row, or click the "Delete" link at the bottom of the detail drawer.

![Delete File](/images/files/delete-file.png "Delete File")

Just as with editing, deleting a file takes very little time, and deleting a directory can potentially take much longer as every subdirectory and child file must also be deleted. An item that has been deleted may temporarily show in your file browser with a status of "Deleting".

**Deleting files and directories cannot be undone**, nor can files that were in a deleted directory be recovered. Any links to the deleted files will cease to function once the deletion process is complete.

## Using Files

Once a file has been uploaded within your application, it is **publicly available** to anybody who has the URL – including across different Losant applications. It is not possible to allow only authenticated users access to a file.

### File URLs

The full URL of any file can be found in the file's detail drawer. You can click the link to download the file or press the "Copy" button to copy the URL to your browser's clipboard for pasting in another place. You can also click the "Link" icon in the file's row to copy the link.

![File URL](/images/files/file-url.png "File URL")

The URL is a combination of ...

- A host, which is the same across all applications
- The application ID, which is unique across the platform
- The file's parent directory (URL encoded)
- The file's name (URL encoded)

Directories cannot be directly linked to; attempting to link to a directory will return an error, instead of a list of the directory's contents.

### Referencing Files in Losant

While a file's URL can be pasted in directly wherever one is needed, there are some helper components in the platform to help you quickly retrieve a file's URL.

![File Code Editor](/images/files/file-code-editor.png "File Code Editor")

In [experience view](/experiences/views/) editors, you can click the "Folder" icon in the bottom right corner of the code textarea to bring up a modal where a file can be selected. Choosing a file will insert the file's full URL at the point where the text cursor was when the button was clicked.

![Select File](/images/files/select-file.png "Select File")

In the [Position Chart](/dashboards/position-chart/) editor, click the "Folder" button to the left of the URL input to bring up the file selection modal. Choosing a file here will replace the input's value with the full URL of the selected file. In this case, only valid images may be chosen (PNGs, GIFs and JPGs).

![Select File Modal](/images/files/select-file-modal.png "Select File Modal")

In the file selection modal, files can be uploaded and directories can be created, but neither can be moved or deleted. A file may be only selected – by pushing the "Select File" button in the detail drawer – at which point the modal will close and return you to the previous view.