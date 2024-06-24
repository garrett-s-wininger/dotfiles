# Tmux

This directory contains the `tmux` configuration that I typically use for my
workflows. Overall, the configuration for this application is only meant to
provide a cleaner look that attempts to match the `neovim` v0.10+ default
colorscheme as well as make some small quality-of-life improvements that I
personally find to make my experience slightly better while developing.

## Setup

The only steps needed to get the config to take effect are to perform the
following which will clone the repo and place the configuration file at the
proper place on the filesystem:

```
${CHECKOUT_DIR}="YOUR_DIR_HERE"
git clone https://github.com/garrett-s-wininger/dotfiles.git "${CHECKOUT_DIR}"
ln -s "${CHECKOUT_DIR}/tmux/.tmux.conf" ~/.tmux.conf
```
