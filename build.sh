#!/bin/bash -e

# Builds README.md including minified source.

echo '1/2) Minifying with Google Closure Compiler...'

# Curl command and options for compiler.
curl='curl -s \
     -d compilation_level=SIMPLE_OPTIMIZATIONS \
     -d output_format=text \
     -d output_info=compiled_code \
    --data-urlencode 'js_code@src/clean-location-href.js' \
    http://closure-compiler.appspot.com/compile'

# Compile and escape sed's modifier characters.
escaped=`$curl | sed 's/[\/&]/\\\\&/g'`

echo 'Done.'
echo '2/2) Updating README.md...'

# Replace the placeholder in the README.
sed "s/{{PLACEHOLDER}}/$escaped/" src/README.template.md > README.md

echo 'All done.'
