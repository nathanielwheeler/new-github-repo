#!/bin/bash
# newrepo [language] [repo name]

# GitHub Variables
GH_API_TOKEN=''
GH_USER=''
LANGUAGE=$1
NEW_REPO_NAME=$2

# TODO generalize directory call

# GitHub repos Create API call
curl -H "Authorization: token $GH_API_TOKEN" https://api.github.com/user/repos -d '{"name": "'"${NEW_REPO_NAME}"'"}'

# TODO generalize gitignore import

# Initialize Git in project directory, and add the GH repo remote.
git init $PROJECT_DIR
git -C $PROJECT_DIR remote add origin git@github.com:$GH_USER/$NEW_REPO_NAME.git

# Commit and push
cd $PROJECT_DIR
git add .
git commit -m "init"
git push -u origin master

