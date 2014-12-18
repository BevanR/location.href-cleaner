#!/bin/bash -e

# Generates a file from it's template.

# Escape sed's modifier characters.
destination=`echo $1 | sed 's|templates/||' | sed 's|.template||'`
jasmine=`cat tests/JASMINE_VERSION`
escaped=`sed 's/[\/&]/\\\\&/g' location-href-cleaner.min.js`
sed "s/{{PLACEHOLDER}}/$escaped/" $1 | sed "s/{{JASMINE}}/$jasmine/g" > $destination
