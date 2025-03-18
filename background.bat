@echo off
echo hello 

mkdir temp 2>nul
transparent-background --source ${PWD} --format png --mode base-nightly --resize static --threshold 0.1 --dest temp
for %%f in (temp\*.png) do (magick "%%f" -trim "%%f")
