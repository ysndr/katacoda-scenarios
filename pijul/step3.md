# Amending Changes


## Concepts

If you were to amend changes in git that are not the HEAD commit, you will need to resort to `git rebase`. But who has used rebase knows that changing a commit will inevitably change the signature of all commits following. The new history created by rebasing will be incompatible with the original one. Therefore, in collaborative environments it is strongly discouraged to rebase public branches.

Notably about pijul is that changes, as long as they don't have dependencies, are commutative. That means that unlike git, which tracks edits in a linear log, the order in which the changes are applied does not matter as long as their dependencies are present. This makes pijul far more flexible! We will cover the notion of "dependency" and "commutative" later in this step.

## Commands

If you want to amend the previous ~commit~ change like in git you can pass an `--amend` flag to the record. Yet, unlike git which allows amending the latest commit, in pijul one can change arbitrary commits:

Say you recorded some change: `pijul record hallo.txt --message "Add hallo"`{{execute}} and then another `pijul record ciao.txt --message "Add Ciao"`{{execute}}.

What if you made a terrible mistake in `hallo.txt`?

Correct it: `echo "Sehr geehrte Bewohner*innen des Planeten Jupiter" > hallo.txt`{{execute}}

.. find the hash of that commit using `pijul log`{{execute}} (copy it to a `./file`{{open}})
.. record the change amending the previous one `pijul record hallo.txt --message "Add hallo" --amend <hash>`{{copy}} (*The content is added to the clipboard, paste it into the terminal and replace `<hash>` by the hash you found in the previous step*)

If you run `pijul log`{{execute}} again, you will find that the previous "Add hallo" change is gone and a new one is on top of the log. This is a presentation of the aforementioned commutativity of changes and channels being just a set of edits without implied total order.

> **Refresher: Commutativity**
>
> Commutativity in mathematical terms means that the order of operands in an operation does not change the outcome.
> A classical example are the '+' or '\*' operations: $a+b = b+a$ and $a*b = b*a$
> While '-' and '/' are not commutative as their result depends on the order

Note that all changes are still present in the `.pijul/changes/**` index, just differently selected in the current pristine.

### Revoking changes

The same principle holds when revoking changes:

If you want to get rid of our "hello world" example with pijul you can literally `unrecord` changes.

Again first get the change hash using `pijul log`

Then run `pijul unrecord <hash>`{{copy}} (*again paste and substitute `<hash>`*)

*Unfortunately we cannot provide the hash as it depends on the time the record is made*

### Dependencies

Mind though that unrecording changes other changes depend on is not possible.

Dependencies are shown when you record a change:

`echo "ciao marte" > ciao.txt`{{execute}}

Recording with `pijul record ciao.txt --message "Edit ciao"`{{execute}} will show the dependency to the change *adding* `ciao.txt`

**Pijul therefore encourages keeping changes small in order to limit the scope of dependencies**
