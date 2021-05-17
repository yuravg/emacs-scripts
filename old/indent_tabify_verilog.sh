#!/usr/bin/env bash

# Re-factoring current buffer by Emacs: untabify(replace Tab by Space) and update indentation

if [ "$#" -eq 0 ] || [ "$1" == '-h' ] || [ "$1" == '--help' ] || [ "$1" == '-help' ]; then
    echo "Usage:"
    echo "  1. <script_name> <file2refactor>"
    echo "  2. $0 <file2refactor>"
    exit 0
fi

FILE2EDIT="$1"
PATH2SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

emacs -batch "$FILE2EDIT"                 \
      -l "$PATH2SCRIPT"/emacs_commands.el \
      -f indent-tabify-verilog-buffer
