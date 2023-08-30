# Neovim Config
This repository contains the NeoVim configuration that I regularly use. The overall goal of the configuration is to remain as close to core NeoVim bindings and configuration
as possible while adding some slight functional improvements to speed up my work within the editor. Deployment of the config is dependent upon setting up your environment 
with [vim-plug](https://github.com/junegunn/vim-plug), copying or symlinking the init file to `$XDG_CONFIG_HOME`, and running `:PlugInstall`. No attempt is made to support 
older versions of Neovim except for the current release.

## Customizations
The modified init file provides the following customizations compared with a standard Neovim distribution:

* Fuzzy finding for easier navigation through nested directories when compared with `netrw`
* LSP installation support and basic configuration, implementation selection tailorable to each user
* Git integration
* Colorscheme updates
