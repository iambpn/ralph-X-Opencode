#!/bin/bash

## Add a new skill from a GitHub repository to your local skills directory

PWD=$(pwd)

# 1st argument is repo url
GITHUB_URL=$1
SKILL_FOLDER_PATH=$2

# if no argument, exit with error message
if [ -z "$GITHUB_URL" ] || [ -z "$SKILL_FOLDER_PATH" ]; then
  echo "Usage: $0 <github-repo-url> <gh-skill-folder-path>"
  exit 1
fi

# skills is PWD/.claude/skills
SKILLS_DIR=$PWD/.claude/skills
temp_name=$(basename $GITHUB_URL .git)
lastPathName=$(basename $SKILL_FOLDER_PATH)

# create skills directory if not exists
mkdir -p $SKILLS_DIR
git clone https://github.com/sawyerhood/dev-browser /tmp/$temp_name
cp -r /tmp/$temp_name/$SKILL_FOLDER_PATH $SKILLS_DIR/$lastPathName
rm -rf /tmp/$temp_name