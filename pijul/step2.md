# Tracking and Committing changes

This step will teach you how track files, make changes and commit them to the repository.

## Concepts

Having used git you know about its three main concepts.

1. The **Workspace** is your current directory containing all files tracked and untracked by git. Changes here are volatile meaning they are not part of the repository. This is unless these changes to files are added to the **Index** using `git add`.
2. The **Index** contains the *staged* changes. As mentioned before these are snapshots already. Also the changes in the index are not necessarily the same as those in the workspace. Similarly to the Workspace, files in the index are *not* bound to the repository (yet). To include them you run `git commit` which adds them to the log of the **Repository**
3. The **Repository** manages a set of commits (snapshots of files). These commits are connected in a directed way - except the root commit they all have at least one parent commit. Because no commit can be parent to an earlier commit, the repository is a directed
 acyclic graph (DAG). If you `checkout` a branch or commit you collect the latest snapshots of all files on a path from the root commit to the checked out commit.

With this in mind how does this translate to pijul? Similarly, as we will see:

1. The Workspace is called **Working Copy**. Like in git, it consists of the current tracked state (the **Tree** computed from the **pristine**) plus all edits divert from the Tree. Changes that belong together and should be tracked as such are `add`ed to the tree.
2. Once tracked in the tree, edits can be `record`ed which adds them to the repositories log of **changes** (see `.pijul/changes/**`). This index contains all changes available in the repository - similarly to git objects. Note that these changes may depend on each other for example if a change is made to one line there need to be a previous change creating this line in the first place. Changes are identified uniquely using cryptographic hashes and can therefore specify their dependencies explicitly. Generally, changes are meant to be as independent as possible allowing them to be applied on different **channels** and even **changed without changing their signature**.
3. **Channels** are somewhat like a git branches. They are managed in the so called **pristine** (*\ˈpri-ˌstēn* : not spoiled, corrupted, or polluted (as by civilization) : PURE^[https://www.merriam-webster.com/dictionary/pristine]). The pristine tracks for each channel a set of changes, a subset of the changes discussed in the previous point, from which the actual file tree is derived.



## commands

In pijul, to add changes we can use some `pijul add`

But first, let's create some content:

`echo "hello world" > hello.txt`{{execute}}

`echo "ciao mars" > ciao.txt`{{execute}}

`echo "hallo Jupiter" > hallo.txt`{{execute}}

*Of course you can add more or other contents and files as you wish using everybody's favorite shell jail `vim` (btw. its `:q`)*

Now lets add them: `pijul add hello.txt`{{execute}}

And record them as change (make sure to add a message): `pijul record --message "Add Hello"`{{execute}}

As you can see the `pijul record` command shows all the hunks/scoped changes available. At this point you can choose what exactly to record. To the user `pijul record` is not unlike `git commit`.

If you want to skip the `add` part you can `record` files directly running e.g.: `pijul record ciao.txt`. This will automatically add the file and record it.

Now, say you are unhappy by a change you have `add`ed (`pijul add ciao.txt`{{execute}}) and want to "unstage" it, run the rather intimidatingly sounding `pijul remove ciao.txt`{{execute}}

Here, we have learned how to add and record changes to pijul but mistakes happen. Click *CONTINUE* to see how to handle them.
