# Challenge

Finally let's play a small game to check if you understood how the pijul commands work.


Your task is to use different essential pijul commands you have seen before.:

1. Mark the current directory as a repository
2. In the current directory, you find 3 files.  add these files to
3. Change the files (using one of the `change_files_*` commands)
4. record the result (tip: *query `ls` to find out what to record*)
5. revoke the last change
6. Change the files (using one of the `change_files_*` commands)
7. and add the new result to the repository

Use the commands below. The task *should* still be possible to finish even if you have used teh wrong pijul commands at some point. There is **no need** to use the command line manually.

Have fun! :)


## Commands available
Choose between these commands to complete the challenge. For help run `pijul --help`{{execute}}.


- `pijul add file-ab.txt`{{execute}}
- `change_files_a`{{execute}} (Make changes to the files)
- `píjul initialize`{{execute}}
- `pijul log`{{execute}}
- `píjul bird`{{execute}}
- `píjul commit file-a.txt -m "commit file A"`{{execute}}
- `pijul record file-b.txt --message "Record file B"`{{execute}}
- `pijul record --message "Make changes"`{{execute}}
- `pijul record file-a.txt --message "Record file A"`{{execute}}
- `píjul commit file-b.txt -m "commit file B"`{{execute}}
- `píjul merge`{{execute}}
- `change_files_1`{{execute}} (Make changes to the files)
- `pijul record --message "Make changes"`{{execute}}
- `pijul add file-bc.txt`{{execute}}
- `pijul init`{{execute}}
- `píjul commit file-c.txt -m "commit file C"`{{execute}}
- `pijul record file-c.txt --message "Record file C"`{{execute}}
- `pijul unrecord --show-changes 1 --reset`{{execute}} (unrecord the last change, *might need to be executed twice*)
