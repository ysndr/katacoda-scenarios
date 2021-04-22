# Tracking and Committing changes

This step will teach you how track files, make changes and commit them to the repository.

## Concepts

Having used git you know about its three main concepts.

1. The **Workspace** is your current directory containing all files tracked and untracked by git. Changes here are volatile meaning they are not part of the repository. This is unless these changes to files are added to the **Index** using `git add`.
2. The **Index** is contains the *staged* changes. As mentioned before these are snapshots already. Also the changes in the index are not necessarily the same as those in the workspace. Similarly to the Workspace file in the index are *not* bound to the repository (yet). To include them you run `git commit` to add them to the log of the **Repository**
3. The **Repository** manges a set of commits (snapshots of files). These commits are connected in a directed way - except the root commit they all have at least one parent commit. Because no commit can be parent to an earlier commit, the repository is a Directed
 Acyclic Graph. If you `checkout` a branch or commit you collect the latest snapshots of all files on a path from the root commit to the checked out commit.

With this in mind how does this translate to pijul? Similarly, as we will see:

1. The Workspace is called **Working Copy**. Like in git, it consists of the current tracked state (the **Tree** computed from the **pristine**) plus all edits divert from the Tree. Changes that belong together and should be tracked as such are `add`ed to the tree.
2. Once tracked in the tree, edits can be `record`ed which adds them to the repositories log of **changes** (see `.pijul/changes/**`). This index contains all changes available in the repository - similarly to git objects. Note that these changes may depend on each other for example if a change is made to one line there need to be a previous change creating this line in the first place. Changes are identified uniquely using cryptographic hashes and can therefore specify their dependencies explicitly. Generally, changes are meant to be as independent as possible allowing them to be applied on different **channels** and even **changed without changing their signature**.
3. **Channels** are somewhat like a git branch. They are managed in the so called **pristine** (*\ˈpri-ˌstēn* : not spoiled, corrupted, or polluted (as by civilization) : PURE^[https://www.merriam-webster.com/dictionary/pristine]). The pristine is tracks for each channel a set of changes, a subset of the changes disucced in the previous point, from which then the actual file tree is derived.

Notably about pijul is that changes, as mentioned before, as long as they don't have many dependencies, are commutative. That means that unlike git, which tracks edits in a linear log, the order in which the changes are applied does not matter as long as their dependencies are present. This makes pijul far more flexible!

Ever wanted to get *that one change* from another branch, used `git cherry-pick` only to end up in a weird situation where you can't merge that branch later on because the new commit conflicts with the original? Also rebasing on branches that are tracked by different users is a pain, as it involves rewriting the history which also affects the hashes of identical commits.

## commands

In pijul to add changes we can use some `pijul add`

But first, let's create some content:

`echo "hello world" > hello.txt`{{execute}}

`echo "ciao marte" > ciao.txt`{{execute}}

`echo "hallo Jupiter" > hallo.txt`{{execute}}

*Of course you can add more or other contents and files as you wish using everybody's favorite shell jail `vim` (btw. its `:q`)*

Now lets add them: `pijul add hello.txt`{{execute}}

And record them as change (make sure to add a message): `pijul record`{{execute}}

As you can see the `pijul record` command shows all the hunks/scoped changes available.

If you want to skip the `add` part you can `record` files directly running e.g.: `pijul record ciao.txt`{{execute}}

Now say you are unhappy by a change you have `add`ed (`pijul add ciao.txt --message "Add Hello"`{{execute}}) and want to "unstage" it run the rather intimidatingly sounding `pijul remove ciao.txt --message "Add Ciao"` {{execute}}

If you want to amend the previous ~commit~ change like in git you can pass an `--amend` flag to the record. Yet, unlike git not only latest changes can be amended:

Say you recorded some change: `pijul record hallo.txt --message "Add hallo"`{{execute}} and then another `pijul record ciao.txt --message "Add hallo"`{{execute}}. What if you made a terrible mistake in `hallo.txt`?

Correct it: `echo "Sehr geehrte Bewohner*innen des Planeten Jupiter" > hallo.txt`{{execute}}

.. find the hash of that commit using `pijul log`{{execute}} (copy it to a to a `./file`{{open}})
.. record the change amending the previous one `pijul record hallo.txt --message "Add hallo" --amend <hash>`{{copy}} (*The content is added to the clipboard, paste it into the terminal and replace `<hash>` by the hash you found in the previous step*)

If you run `pijul log`{{execute}} again, you will find that the previous "Add hallo" change is gone and a new one is on top of the log. This is a presentation of the aforementioned commutativity of changes and channels being just a set of edits without implied total order.

Note that all changes are still present in the `.pijul/changes/**` index just differently selected in the current pristine.
