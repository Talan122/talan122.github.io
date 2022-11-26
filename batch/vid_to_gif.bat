
:run
@echo off
set /p videoInput="Input video -> "
set /p gifOutput="Output name -> "
set /p additionalArgs="Additional ffmpeg args -> "

echo "Starting.."

ffmpeg -i "%videoInput%" %additionalArgs% -filter_complex "[0:v] palettegen" palette.png
ffmpeg -i "%videoInput%" %additionalArgs% -i palette.png -filter_complex "[0:v] fps=30,scale=480:-1 [new];[new][1:v] paletteuse" "%gifOutput%"

del "palette.png"

echo "Done!"
pause