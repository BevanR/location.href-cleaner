#!/bin/bash -e

# Builds minified source, documentation and tests.

directory=$(pwd)
steps=3
step=0
function status {
  echo "$step/$steps) $1"
  step=$((step + 1))
}

function compile {
  curl -s \
       -d compilation_level=SIMPLE_OPTIMIZATIONS \
       -d output_format=text \
       -d output_info=compiled_code \
       --data-urlencode js_code@location-href-cleaner.js \
       http://closure-compiler.appspot.com/compile
}

status 'Minifying with Google Closure Compiler...'
compile > location-href-cleaner.min.js

status 'Generating files...'
find templates -type f \! -exec $(pwd)/scripts/generate.sh {} \;

status 'Installing Jasmine ...'
scripts/build_tests.sh

status 'All done.'
