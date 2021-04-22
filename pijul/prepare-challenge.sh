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

alias píjul=cowsay -f /root/clippy.cow "Not a command:"

clear pi

cd /challenge
