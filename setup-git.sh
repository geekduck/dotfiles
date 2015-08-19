#!/bin/bash

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      # ここに設定
      ;;
    # Linux
    linux*)
      # ここに設定
      echo "Add execute permission to adiff-highlight."
      sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
      ;;
esac
