@echo off
echo 🚀 Déploiement Railway Final - Correction du chemin Kestra

echo 📋 Étape 1: Utilisation du Dockerfile.railway.final
echo ✅ Chemin correct: /usr/local/bin/kestra
echo ✅ Image de base: kestra/kestra:latest

echo.
echo 📋 Étape 2: Préparation du déploiement
git add .

echo 💾 Création du commit final...
for /f "tokens=1-6 delims=/ " %%a in ('date /t') do set datestr=%%c-%%a-%%b
for /f "tokens=1-5 delims=:. " %%a in ('time /t') do set timestr=%%a%%b%%c
set "commitMessage=Railway Final Fix: Chemin Kestra corrigé - %datestr% %timestr%"

git commit -m "%commitMessage%"

echo.
echo 📋 Étape 3: Déploiement sur Railway
echo ⬆️ Push vers GitHub (déclencheur Railway)...
git push origin develop

echo.
echo 📋 Étape 4: Configuration Railway
echo.
echo 🔧 Utilisez ces paramètres sur Railway:
echo 1. Dockerfile: Dockerfile.railway.final
echo 2. Commande: /usr/local/bin/kestra server standalone
echo 3. Port: 8080
echo 4. Health check: /health
echo.
echo ✅ Déploiement Railway final configuré!
echo 🌐 Votre app sera disponible sur l'URL Railway

pause
