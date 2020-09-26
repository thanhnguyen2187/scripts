#!/bin/bash

$NAME=$1

create-react-app $NAME --typescript
cd $NAME

# Setup Typescript
npm i --save-dev \
    typescript \
    @types/react \
    @types/node
npx json -I -f \
    tsconfig.json -e "this.compilerOptions.strict = true"
