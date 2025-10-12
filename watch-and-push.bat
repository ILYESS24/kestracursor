@echo off
echo 🔍 Surveillance des changements et auto-push vers GitHub
echo Appuyez sur Ctrl+C pour arrêter

:loop
echo.
echo ⏰ Vérification des changements... %date% %time%

REM Vérifier s'il y a des changements
git status --porcelain > temp_status.txt
if %errorlevel% neq 0 (
    echo ❌ Erreur lors de la vérification du statut Git
    goto end
)

REM Lire le fichier temporaire
set /p changes=<temp_status.txt
del temp_status.txt

if not "%changes%"=="" (
    echo 📝 Changements détectés! Pushing...
    
    git add .
    for /f "tokens=1-6 delims=/ " %%a in ('date /t') do set datestr=%%c-%%a-%%b
    for /f "tokens=1-5 delims=:. " %%a in ('time /t') do set timestr=%%a%%b%%c
    set "commitMessage=Auto-push: %datestr% %timestr%"
    
    git commit -m "%commitMessage%"
    git push origin develop
    
    echo ✅ Push réussi!
) else (
    echo ℹ️ Aucun changement détecté
)

REM Attendre 30 secondes avant la prochaine vérification
timeout /t 30 /nobreak > nul
goto loop

:end
echo 🛑 Surveillance arrêtée
pause
