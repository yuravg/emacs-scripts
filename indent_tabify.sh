#!/usr/bin/env bash

# Re-factoring current buffer by Emacs: untabify(replace Tab by Space) and update indentation

if [ "$#" -eq 0 ] || [ "$1" == '-h' ] || [ "$1" == '--help' ] || [ "$1" == '-help' ]; then
    echo "Usage:"
    echo "  1. <script_name> <file2refactor>"
    echo "  2. $0 <file2refactor>"
    exit 0
fi

FILE2EDIT="$1"
PATH2SCRIPT="$HOME/bin/emacs-scripts"

emacs -batch "$FILE2EDIT"                 \
      -l "$PATH2SCRIPT"/emacs_commands.el \
      -f unix-file
