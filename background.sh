#! /bin/bash

echo "hello"

mkdir -p "converted-to-png"
mkdir -p "background-removed"

for f in *.* ; do
  magick "$f" "converted-to-png/${f%.*}.png"
done

transparent-background --source "${PWD}/converted-to-png" --format png --mode base-nightly --resize static --threshold 0.1 --dest "${PWD}/background-removed"

for f in ./background-removed/*.png ; do 
  magick "$f" -trim "$f"
done
