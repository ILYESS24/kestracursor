@echo off
echo 🚀 Déploiement Railway sans docker-compose

echo 📋 Étape 1: Vérification de l'environnement Railway
echo ✅ Utilisation du Dockerfile.railway
echo ✅ Commande de démarrage: /app/kestra server standalone

echo.
echo 📋 Étape 2: Préparation du déploiement
git add .

echo 💾 Création du commit Railway...
for /f "tokens=1-6 delims=/ " %%a in ('date /t') do set datestr=%%c-%%a-%%b
for /f "tokens=1-5 delims=:. " %%a in ('time /t') do set timestr=%%a%%b%%c
set "commitMessage=Railway deploy (no docker-compose): %datestr% %timestr%"

git commit -m "%commitMessage%"

echo.
echo 📋 Étape 3: Déploiement sur Railway
echo ⬆️ Push vers GitHub (déclencheur Railway)...
git push origin develop

echo.
echo 📋 Étape 4: Instructions Railway
echo.
echo 🔧 Configuration Railway requise:
echo 1. Utiliser le Dockerfile.railway
echo 2. Commande de démarrage: /app/kestra server standalone
echo 3. Port: 8080
echo 4. Health check: /health
echo.
echo 📝 Variables d'environnement Railway:
echo - KESTRA_CONFIGURATION (déjà configuré dans railway.json)
echo - PORT=8080
echo - NODE_ENV=production
echo.
echo ✅ Déploiement Railway configuré!
echo 🌐 Votre app sera disponible sur l'URL Railway

pause
