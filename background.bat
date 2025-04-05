@echo off
echo hello 

mkdir "converted-to-png" 2>nul
mkdir "background-removed" 2>nul

for %%f in (*.*) do (
  magick "%%f" -convert "converted-to-png\%%f.png"
)

transparent-background --source "%cd%\converted-to-png" --format png --mode base-nightly --resize static --threshold 0.1 --dest "background-removed"

for %%f in ("background-removed\*.png") do (
  magick "%%f" -trim "%%f"
)
