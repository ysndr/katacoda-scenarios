#!/bin/bash
exec docker run --name nix --rm -i -t -v /root/workspace:/workspace -v /root/pijul-projects:/pijul-projects -w /workspace nixos/nix nix-shell -p pijul git nano vim
