# Neovim Config
This directory contains the Neovim configuration that I regularly use. The
overall goal of the configuration is to remain as close to core Neovim
bindings and configuration as possible while adding some slight functional
improvements to speed up my work within the editor. Deployment of the config
is based upon Lazy which does all of the heavy lifting while its setup is
handled directly in the provided initialization file.

To automatically configure your Neovim installation, simply run the configure
script provided at the root of the directory. Otherwise, you may manually
copy the parts of the init file you'd like into your runtime path, though you'll
need to copy over the plugins module so that Lazy can properly parse the plugin
specification.

## Customizations
The modified init file provides the following customizations compared with a
standard Neovim distribution:

* Simple statusline
* Fuzzy finding, searching
* LSP integration, configuration for multiple languages
* TODO/FIX comment highlighting, searching
* Git TUI
* Keybind-based code commenting

## Credits
A large part of this new config version was based off of the open-source example
developed as [Kickstart](https://github.com/nvim-lua/kickstart.nvim/tree/master)
. Thank you to the developers of the project for providing a solid baseline to
improve the editing experience within Neovim.
