!/bin/bash

# Run this at the root of your project to generate
# a stripped down main with all input/includes in
# a single tex file and without comments.
# Generates a zip file for easy upload to Arxiv.
# Make sure you mkdir arxiv folder at the root of your project.
# This is were all the output will be added (images, bib, tex...)

# Change directory to parent path, in order to make this script
# independent of where we call it from.
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Ensure file main.tex and main.bbl exist
MAIN_TEX="main.tex"
MAIN_BBL="main.bbl"
if [[ ! -f "$MAIN_TEX" ]]; then
  echo "File $MAIN_TEX  does not exist..."
  exit 1
fi
if [[ ! -f "$MAIN_BBL" ]]; then
  echo "File $MAIN_BBL does not exist..."
  exit 1
fi
# Copy only figures required to arxiv folder, remove comments from all sources, expand bib to bbl inside main tex.
perl $PARENT_PATH/latexpand --copy-figures --empty-comments --show-graphics --verbose --expand-bbl main.bbl main.tex -o main-stripped.tex

# Zip relevant files into arxiv_submission.zip
# Clean previous zips
rm ./arxiv_submission.zip

# Build zip
ZIP_NAME="arxiv_submission.zip"
ARXIV_FOLDER="arxiv"
echo "Zipping all relevant files as: ${ZIP_NAME}"
cp IEEEtran.bst IEEEtran.cls ieeeconf.cls $ARXIV_FOLDER

zip -r ./${ZIP_NAME} arxiv/*
