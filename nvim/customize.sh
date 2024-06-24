#!/bin/sh

# Installs this source-controlled setup of NVim into appropriate paths on the
# system. Will remove existing data for the Lazy plugin as well as the current
# NVim configuration.

# Perform a cleanup of existing data
XDG_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
NVIM_CONFIG_DIR="${XDG_CONFIG_DIR}/nvim"

if [ -d "${NVIM_CONFIG_DIR}" ]; then
	rm -fR "${NVIM_CONFIG_DIR}"
elif [ -L "${NVIM_CONFIG_DIR}" ]; then
	rm -i "${NVIM_CONFIG_DIR}"
fi

XDG_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"
LAZY_SUFFIX="/nvim/lazy"
LAZY_DATA_DIR="${XDG_DATA_DIR}${LAZY_SUFFIX}"
LAZY_STATE_DIR="${XDG_STATE_DIR}${LAZY_SUFFIX}"

for DIR in "${LAZY_DATA_DIR}" "${LAZY_STATE_DIR}"; do
	rm -fR "${DIR}"
done

# Create a symbolic link over to this repo's config files
SCRIPT="$(readlink -f ${0})"
SCRIPT_DIR="$(dirname ${SCRIPT})"

ln -s "${SCRIPT_DIR}" "${NVIM_CONFIG_DIR}"
