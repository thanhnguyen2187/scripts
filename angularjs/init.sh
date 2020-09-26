#!/bin/bash

PROJECT_NAME=$1

cd ${PROJECT_NAME}

git init
# create .gitignore here

npm init
npm install \
    angular \
    angular-loader \
    angular-route \
    angular-mocks
