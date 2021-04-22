# Collaborating and publishing

This step will teach you how to clone an existing repository and collaborate.

## Concepts

1. With git, when you want to clone a repository, you are using the command `git clone` 

2. When you want to add the changed file to the commit, you use the `git add` command.

3. To commit your changes, you use `git commit`.

4. And finally you push your changes to the remote with `git push`

5. Additionally, you can request your upstream project to pull your changes into their branch. For this, you send a pull request from you current branch with `git request-pull`

## Pijul commands

1. First let's clone our first repository `pijul clone https://nest.pijul.com/ysndr/Explorations`{{execute}}. And we can go in the cloned repository `cd Explorations`{{execute}} and see the files `ls -la`{{execute}}

2. Now we want to edit our file `vim hello.txt`{{execute}}. You can add some text and save it.

3. To add the file in the commit, we execute `pijul add hello.txt`{{execute}}, same as git.

4. Then we can record your change `pijul record`{{execute}} the git equivalent to `git commit`. You can see that an editor is open, you need to add a record message, save and close.

5. And finally, we push your changes to the server with `pijul push https://nest.pijul.com/ysndr/Explorations`