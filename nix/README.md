# NixShell Configurations

This portion of the repository contains various NixShell configurations used to
configure a development environment in a repeatable way. Use of the configs
relies upon having NixShell installed which can be done by following the
[upstream documentation](https://nixos.org/download). Once `nix-shell` exists on
the system $PATH, you can load your environment in through `nix-shell -p <file>`
which will make the desired applications available to you without requiring or
stepping on binaries that are present through your distribution's repositories.
