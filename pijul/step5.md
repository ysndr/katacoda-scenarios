# Branching and merging

This step will first teach you how to create new branches and switch among them. And finally how to merge and resolve conflicts. For this we created a small scenario where Alice and Bob are adding todo tasks on their own branch to finally merge everything on the main branch.


## Concepts

In git, to create and switch to a new branch, you use `git checkout -b "Branch name"`. You can omit the `-b` to switch to an existing branch: `git checkout "Existing branch name"`. To merge a branch in the current one, you execute `git merge "Branch name"`. If a conflict occur, you get a message.

In pijul, instead of branches the concept is called channels. Channels are just different subset of sound changes tracked in the repository. As there is no clear graph between them -- remember: they commute -- channels are "merged" by selecting changes from one channel and just applying them onto another.



## Scenario

You can see that the file todo.txt has a todo list `cat todo.txt`{{execute}}. We are going to add the file `pijul add todo.txt `{{execute}} and record the changes `pijul record -a -m "Main todo"`{{execute}} (Just close the editor).

We want to create a new channel bob `pijul fork bob`{{execute}}. We can see `pijul channel`{{execute}} the 2 channels and switch to the newly created `pijul channel switch bob`{{execute}}.

Add a line in the Bob's todo list `echo "Wash the car" >> todo.txt`{{execute}} and record it `pijul record -a -m "Bob todo"`{{execute}}.

We can do the same for Alice, we create a new channel from the main one `pijul fork alice --channel main`{{execute}} and switch there `pijul channel switch alice`{{execute}}. Add a line `echo "Take the dog for a walk" >> todo.txt`{{execute}} and record the changes `pijul record -a -m "Alice todo"`{{execute}}.

Now we want to merge Bob's channel into Alice. To do so, we simply pull the branch into the current one `pijul pull . --from-channel bob`{{execute}}. Notice that pijul is not giving any information in case of conflict.

But you can see `cat todo.txt`{{execute}} that a conflict occurred. To resolve it, simply delete `vim todo.txt`{{execute}} the lines 3, 5 and 7. You can now record the merge `pijul record -a -m "Merge todo"`{{execute}} and switch to the main channel `pijul channel switch main`{{execute}}.

We finally merge Alice's channel into the main one `pijul pull . --from-channel alice`{{execute}}, you can see all the patches we are applying. Our todo is now complete `cat todo.txt`{{execute}}
