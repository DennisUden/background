#! /bin/bash

echo "hello"

transparent-background --source ${PWD} --format png --mode base-nightly --resize static --threshold 0.1 --dest temp && for f in ./temp/*.png ; do convert "$f" -trim "${f%.png}".png ; done
