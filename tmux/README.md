# Tmux

This directory contains the `tmux` configuration that I typically use for my
workflows. In the general case, you will need to set up `TPM` prior to setting
up the provided configs so that the appropriate settings are downloaded. After
the plugin manager [setup](https://www.github.com/tmux-plugins/tpm) is up,
you should simply be able to install, updgrade, or clean your plugins through
the instructions on the `TPM` repo (namely `prefix + I`, `prefix + U`, and
`prefix + alt + u`).

Overall, the configuration for this application is only meant to provide a
cleaner look that attempts to match the `neovim` configuration in colorscheme.

# Additional Requirements

The theme relies on `Powerline` which, due to its icons, requires a patched
font to render correctly but otherwise is functional without it. My choice is
typically from [NerdFonts](https://www.nerdfonts.com) with `JetBrainsMono` as
my selection.
