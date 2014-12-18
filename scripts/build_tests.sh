#!/bin/bash -e

# Builds the test environment.

# The directory to install jasmine into.
directory=tests/jasmine

# Jasmine archive's filename.
file=jasmine-standalone-`cat tests/JASMINE_VERSION`.zip

# Check if the directory already exists.
if [ ! -d "$directory" ]; then

  # Check if the zip is already in this directory.
  if [ ! -f "$file" ]; then
    echo 'Downloading Jasmine...'
    wget https://github.com/jasmine/jasmine/raw/master/dist/$file
  fi

  echo 'Unzipping Jasmine...'
  unzip -d $directory $file
  rm $file
fi

# Describe how to run the tests.
echo 'Open http://monty:python@example.com/path/to/location.href-cleaner/tests/runner.html in a web browser to run tests'
