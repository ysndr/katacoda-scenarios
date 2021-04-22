# Setting up

*⚠️ Wait until katacoda has inititalized the environment ⚠️*

You will find yourself in a docker image with pijul available. The working directory is mounted to the `workspace/` folder in the editor window.
If you want to follow this tutorial locally install pijul as described in its [documentation](https://pijul.org/manual/installing.html)

## Initializing an new project

With git the first thing to do is to mark a directory as a repository tracked by git. this is usually done by running `git init` in that directory.

Analogously `pijul init`{{execute}} will mark the workspace as a repository. You can check either in the file browser or by running `ls -la`{{execute}} which will show a `.pijul` folder.

## Familiarize yourself with pijul

A good idea when using a new tool is to inspect its command line self documentation (if available). Luckily pijul makes use of a great rust library offering exactly that!

Run `pijul --help`{{execute}} to get a glimpse of what is possible. Of course not all is self explanatory, but we will cover most of the commands in the following steps.

*You're good to go, click CONTINUE to start using pijul*
