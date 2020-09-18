#!/usr/bin/env bash

# Recode buffer to UTF-8 form cp1251

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
      -f recode-to-utf8-from-cp1251
