#!/bin/bash

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *) bat --color always "$1" ;;
esac
