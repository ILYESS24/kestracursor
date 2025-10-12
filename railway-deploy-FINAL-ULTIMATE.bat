@echo off
echo 🚀 DÉPLOIEMENT FINAL ULTIME - Image officielle Kestra

echo 📋 Vérification de l'authentification Railway...
railway whoami

if %errorlevel% neq 0 (
    echo 🚨 Non connecté à Railway. Veuillez vous connecter:
    railway login
    pause
    exit /b 1
)

echo ⬆️ Déploiement avec l'image officielle Kestra (SANS modification)...
railway deploy --service kestra --dockerfile Dockerfile.railway.FINAL

if %errorlevel% neq 0 (
    echo ❌ Erreur lors du déploiement sur Railway.
    pause
    exit /b 1
)

echo ✅ Déploiement Railway terminé!
echo 🌐 Ouverture de l'URL du déploiement...
railway open

echo ⏳ Attente de 60 secondes pour le démarrage du conteneur...
timeout /t 60 /nobreak > nul

echo 📊 Vérification de l'état de Kestra sur Railway...
echo Veuillez vérifier manuellement l'état de Kestra sur votre déploiement Railway.

echo 🎉 DÉPLOIEMENT FINAL TERMINÉ!
echo 💡 Cette fois ça va marcher car on utilise l'image officielle SANS modification!
pause
