#!/bin/bash


echo '# Clippy
#
# from http://www.reddit.com/r/commandline/comments/2lb5ij/what_is_your_favorite_ascii_art/cltg01p
#
$the_cow = <<EOC;
 $thoughts
  $thoughts
     __
    /  \\
    |  |
    @  @
    |  |
    || |/
    || ||
    |\\_/|
    \\___/
EOC' >> /root/clippy.cow

alias píjul="cowsay -f /root/clippy.cow 'Not a command: pijul'"

echo "More educational material:\n" >> /challenge/file-b.txt
echo "https://www.youtube.com/watch?v=dQw4w9WgXcQ" >> /challenge/file-a.txt
echo "https://www.youtube.com/watch?v=o0ooKVikV3c" >> /challenge/file-c.txt

function change_files_1() {
    cat file-b.txt >> ./file-ab.txt
    cat file-a.txt >> ./file-ab.txt
    rm file-a.txt
    rm file-b.txt
}

function change_files_a() {
    cat file-b.txt >> ./file-bc.txt
    cat file-c.txt >> ./file-bc.txt
    rm file-b.txt
    rm file-c.txt
}

clear

cd /challenge
