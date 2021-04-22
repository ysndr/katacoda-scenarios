#!/bin/bash
exec docker run --name nix --rm -i -t -v /root/workspace:/workspace -v /root/pijul-projects:/pijul-projects -v /root/challenge:/challenge -w /workspace nixos/nix nix-shell -p pijul git nano vim
