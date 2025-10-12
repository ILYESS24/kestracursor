@echo off
echo 🚀 Auto-push vers GitHub - Tous les changements

echo 📋 Vérification du statut Git...
git status

echo 📁 Ajout de tous les changements...
git add .

REM Vérifier s'il y a des changements à commiter
git diff --cached --exit-code > nul
if %errorlevel% neq 0 (
    REM Créer un commit avec timestamp
    for /f "tokens=1-6 delims=/ " %%a in ('date /t') do set datestr=%%c-%%a-%%b
    for /f "tokens=1-5 delims=:. " %%a in ('time /t') do set timestr=%%a%%b%%c
    set "commitMessage=Auto-push: %datestr% %timestr%"
    
    REM Vérifier que le message n'est pas vide
    if "%commitMessage%"=="" set "commitMessage=Auto-push: %date% %time%"
    
    echo 💾 Création du commit: %commitMessage%
    git commit -m "%commitMessage%"
    
    echo ⬆️ Push vers GitHub...
    git push origin develop
    
    echo ✅ Push réussi vers GitHub!
) else (
    echo ℹ️ Aucun changement à commiter. Repository à jour.
)

echo 📊 Statut final:
git status --short

echo 🎉 Script terminé!
pause
