# Branching and merging



## Concepts

## Scenario

You can see that the file todo.txt has a todo list `cat todo.txt`{{execute}}. We are going to add the file `pijul add todo.txt `{{execute}} and recorde the changes `pijul record -a -m "Main todo"`{{execute}} (Just close the editor).

The we want to create a new channel bob `pijul fork bob`{{execute}}. We can see `pijul channel`{{execute}} the 2 channels and switch to the newly created `pijul channel switch bob`{{execute}}.

Add a line in the Bob's todo list `vim todo.txt`{{execute}} and record it `pijul record -a -m "Bob todo"`{{execute}}.

We can do the same for Alice, we create a new channel from the main one `pijul fork alice --channel main`{{execute}} and switch there `pijul channel switch alice`{{execute}}. Add a line `vim todo.txt`{{execute}} and recode the changes `pijul record -a -m "Alice todo"`{{execute}}.

Now we want to merge Bob's channel into Alice. To do so, we simply pull the branche into the current one `pijul pull . --from-channel bob`{{execute}}.

You can see `cat todo.txt`{{execute}} that a conflict occured. To resolve it, simply delete `vim todo.txt`{{execute}} the lines 3, 5 and 7. You can now recorde the merge `pijul record -a -m "Merge todo"`{{execute}} and switch to the main channel `pijul channel switch main`{{execute}}.

We finally merge Alice's channel into the main one `pijul pull . --from-channel alice`{{execute}}, you can see all the patches we are applying. Our todo is now complete `cat todo.txt`{{execute}}





