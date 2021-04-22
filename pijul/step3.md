# Revoking changes

*continuing the previous step*

## Concepts

Again, think about removing changes. Like amending changes in the step before, in git how do you do that? Usually, it requires rebasing the history. But if you ever rebased a branch in git you see that the identity of all successive commits is changed! This means its **incompatible** with everyone elses history and is therefore strongly discouraged on public branches

As we've seen before, commutativity in pijul allows us to delete changes (as long no other change depends on it).

## Commands

So if we want to get rid of our "hello world" example with pijul you can literally `unrecord` changes.

Again first get the change hash using `pijul log`

Then run `pijul unrecord <hash>`{{copy}} (*again paste and substitute `<hash>`*)
