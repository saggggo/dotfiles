#!/bin/bash

deploy(){
        echo "deploy"
}

initialize(){
        echo "initialize"
}


if [ "$1" = "deploy" ]; then
        deploy
elif [ "$1" = "init" ]; then
        initialize
fi
