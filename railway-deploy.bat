@echo off
echo 🚀 Déploiement automatique sur Railway avec vérification Kestra

echo 📋 Vérification de l'état actuel de Kestra...
docker ps | findstr kestra
if %errorlevel% neq 0 (
    echo ❌ Kestra n'est pas en cours d'exécution
    echo 🔧 Lancement de la réparation automatique...
    call .\fix-kestra-docker.bat
) else (
    echo ✅ Kestra est en cours d'exécution
)

echo.
echo 📦 Préparation du déploiement...
echo 📁 Ajout de tous les changements...
git add .

echo 💾 Création du commit de déploiement...
for /f "tokens=1-6 delims=/ " %%a in ('date /t') do set datestr=%%c-%%a-%%b
for /f "tokens=1-5 delims=:. " %%a in ('time /t') do set timestr=%%a%%b%%c
set "commitMessage=Auto-deploy Railway: %datestr% %timestr%"

git commit -m "%commitMessage%"

echo ⬆️ Push vers GitHub (déclencheur Railway)...
git push origin develop

echo.
echo 🔍 Vérification post-déploiement...
echo ⏳ Attente du déploiement Railway (60 secondes)...
timeout /t 60 /nobreak > nul

echo 📊 Vérification de l'état final...
docker ps

echo.
echo 🌐 Test de l'API Kestra...
curl -s http://localhost:8081/health > nul
if %errorlevel% equ 0 (
    echo ✅ API Kestra accessible
) else (
    echo ❌ API Kestra non accessible
    echo 🔧 Relancement de la réparation...
    call .\fix-kestra-docker.bat
)

echo.
echo ✅ Déploiement terminé!
echo 🌐 Kestra: http://localhost:8080
echo 🔍 Health: http://localhost:8081/health

pause
