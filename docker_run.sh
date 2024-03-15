#!/bin/bash

docker build -t ctypesgen-ng .

PROJECT_PATH=$1

docker run -u $(id -u):$(id -g) -v "$PROJECT_PATH:$PROJECT_PATH" -w $PROJECT_PATH ctypesgen-ng ${@:2}