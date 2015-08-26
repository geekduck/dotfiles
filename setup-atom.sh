#!/bin/bash

apm install Sublime-Style-Column-Selection
apm install atom-beautify
apm install minimap
apm install linter
apm install pigments
apm install pretty-json
apm install file-icons
apm install regex-railroad-diagram
apm install script
apm install seti-ui
apm install seti-syntax

case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      apm install term2
    # Linux
    linux*)
      ;;
esac
