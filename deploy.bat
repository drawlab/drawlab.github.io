@echo off
REM Deploy Excalidraw Smart Presentation to drawlab.github.io
REM Run from: D:\pcloud\workspace\code\window\excalidraw-smart-presentation

echo === Build ===
cd /d "D:\pcloud\workspace\code\window\excalidraw-smart-presentation\excalidraw-app"
call node ..\node_modules\vite\bin\vite.js build
if errorlevel 1 (
    echo Build failed!
    pause
    exit /b 1
)

echo === Deploy ===
REM Copy build to temp
rmdir /s /q "C:\Users\quocn\AppData\Local\Temp\drawlab-pages" 2>nul
mkdir "C:\Users\quocn\AppData\Local\Temp\drawlab-pages"
xcopy /s /e /y "build\*" "C:\Users\quocn\AppData\Local\Temp\drawlab-pages\"
echo. > "C:\Users\quocn\AppData\Local\Temp\drawlab-pages\.nojekyll"

REM Push to gh-pages
cd /d "C:\Users\quocn\AppData\Local\Temp\drawlab-pages"
git init
git checkout -b main
git add .
git commit -m "Deploy %date% %time%"
git remote add origin https://github.com/drawlab/drawlab.github.io.git 2>nul
git push -f origin main:gh-pages

echo === Done ===
echo Site updated: https://drawlab.github.io/
pause
