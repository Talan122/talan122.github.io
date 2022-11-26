
:run
@echo off
set /p audioInput="Input audio -> "
set /p imageInput="Input image -> "
set /p outputName="Output name -> "

echo "Starting.."

ffmpeg -i "%audioInput%" -i "%imageInput%" -acodec libmp3lame -vcodec mjpeg temp.mkv
ffmpeg -i temp.mkv -vcodec mpeg4 %outputName%.mp4

del temp.mkv

echo "Done!"

pause