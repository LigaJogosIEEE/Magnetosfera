cd src
zip -r ../game.love ./*
cd ../
cat bin/love.exe game.love > bin/Magnetosfera.exe

cd bin/
zip -r ../magnetosfera.zip SDL2.dll OpenAL32.dll Magnetosfera.exe license.txt love.dll lua51.dll mpg123.dll msvcp120.dll msvcr120.dll
