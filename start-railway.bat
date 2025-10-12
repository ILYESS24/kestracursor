@echo off
echo 🚀 Démarrage de Kestra sur Railway...

REM Vérifier si Kestra est déjà en cours d'exécution
tasklist | findstr "kestra" > nul
if %errorlevel% equ 0 (
    echo ✅ Kestra est déjà en cours d'exécution
    exit /b 0
)

REM Démarrer Kestra directement
echo 📦 Démarrage de Kestra...
/app/kestra server standalone
