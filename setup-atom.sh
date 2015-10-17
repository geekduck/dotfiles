#!/bin/bash

apm install Sublime-Style-Column-Selection
apm install merge-conflicts
apm install atom-beautify
apm install highlight-selected
apm install minimap
apm install minimap-find-and-replace
apm install minimap-git-diff
apm install minimap-highlight-selected
apm install minimap-selection
apm install minimap-split-diff
apm install linter
apm install linter-htmlhint
apm install linter-jshint
apm install linter-coffeelint
apm install linter-eslint
apm install linter-csslint
apm install linter-scss-lint
apm install linter-jsonlint
apm install linter-jsxhint
apm install linter-rubocop
apm install pigments
apm install pretty-json
apm install file-icons
apm install regex-railroad-diagram
apm install script
#apm install seti-ui
#apm install seti-syntax
apm install colorpicker
apm install git-history
apm install expose
apm install pdf-view
apm install autocomplete-emojis

case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      apm install term2
      ;;
    # Linux
    linux*)
      ;;
esac
