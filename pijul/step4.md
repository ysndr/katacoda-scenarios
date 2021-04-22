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

2. Now edit the hello file `vim hello.txt`{{execute}}. You can add your name and say hello.

3. To add the file in the commit, we execute `pijul add hello.txt`{{execute}}, same as git.

4. Then we can record your change `pijul record`{{execute}} the git equivalent to `git commit`. You can see that an editor is open, you need to add a record message, save and close.

5. OPTIONAL : And finally, you can push the changes to the server with `pijul push username@nest.pijul.com/ysndr/Explorations`. This will automatically create a pull request. Notice that you need to create an account first.