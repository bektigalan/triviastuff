@echo off
mkdir "converted"
for %%i in (*.ts) do (
    ffmpeg -i "%%i" -c:v libx264 -c:a aac "converted\%%~ni.mp4"
    if exist "converted\%%~ni.mp4" (
        del "%%i"
    )
)
