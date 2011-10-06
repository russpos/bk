# BK #

`bk` is a simple tool for zshell to aid in bookmarking folders on your system and easily moving there with your
terminal.  To install, simply make sure `bk.zsh` is sourced at some point
during the execution of your `.zshrc` file. Eg:

    source ~/tools/bk/bk.zsh

## Usage ##

To use `bk`, simply type `bk` to view the latest help menu.

    $ bk
    Bookmark Manager v2.0
    ---------------------

    bk               - Display this help menu
    bk -l            - List all bookmarks
    bk <bookmark>    - Go to bookmark
    bk -c <bookmark> - Create new bookmark of CWD
    bk -d <bookmark> - Delete bookmark

### Creating a new bookmark ###

Using the create command, a bookmark is created for the current working directory.

    $ (~/Repos/git/russp-blog) bk -c blog
    Created bookmark 'blog' at /Users/russp/Repos/git/russp-blog

You can then use this bookmark by simply using `bk <bookmark>`

    $ (~) bk blog
    $ (~/Repos/git/russp-blog)

`bk` supports zshell tab completion as well, to make accessing your existing bookmarks even easier:

    $ (~) bk <TAB>
    blog  util

### Listing all bookmarks ###

The list command is used to list all of the bookmarks currently created.

    $ (~) bk -l
    [blog]	/Users/russp/Repos/git/russp-blog
    [util]	/Users/russp/Repos/git/russp-home/util

### Deleting a bookmark ###

Using the `bk -d` command with the name of an existing bookmark will delete that bookmark from your
collection.

    $ (~) bk -d blog
    Removed bookmark 'blog'


## Configuration ##

For the most part, there really isn't much to configure with `bk`, other than the storage location of your bookmarks.  By default,
they are stored in `$HOME/.bk`.  This can be changed by setting the environment variable `$BK_FOLDER`.  This can be handle for having
multiple groups of bookmarks

    $ (/tmp) bk -l
    [blog]	/Users/russp/Checkouts/russp-blog
    [util]	/Users/russp/Checkouts/russp-home/util

    $ (/tmp) BK_FOLDER=~/.bk_alt
    $ (/tmp) bk -c tmp
    Creating /Users/russp/.bk_alt
    Created bookmark 'tmp' at /tmp

    $ (/tmp) bk -l
    [tmp]	/tmp

    $ (~) BK_FOLDER=~/.bk
    [blog]	/Users/russp/Checkouts/russp-blog
    [util]	/Users/russp/Checkouts/russp-home/util
