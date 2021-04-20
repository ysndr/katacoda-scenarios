#!/bin/bash
exec docker run --name nix --rm -i -t -v /root/workspace:/workspace -w /workspace nixos/nix nix-shell -p pijul
