# Tracking and Committing changes

This step will teach you how track files, make changes and commit them to the repository.

## Concepts

Having used git you know about its three main concepts.

1. The **Workspace** is your current directory containing all files tracked and untracked by git. Changes here are volatile meaning they are not part of the repository. This is unless these changes to files are added to the **Index** using `git add`.
2. The **Index** is contains the *staged* changes. As mentioned before these are snapshots already. Also the changes in the index are not necessarily the same as those in the workspace. Similarly to the Workspace file in the index are *not* bound to the repository (yet). To include them you run `git commit` to add them to the log of the **Repository**
3. The **Repository** manges a set of commits (snapshots of files). These commits are connected in a directed way - except the root commit they all have at least one parent commit. Because no commit can be parent to an earlier commit, the repository is a Directed
 Acyclic Graph. If you `checkout` a branch or commit you collect the latest snapshots of all files on a path from the root commit to the checked out commit.

With this in mind how does this translate to pijul? Similarly, as we will see:

## git

## commands
