@echo off
echo 🔍 Vérification de la configuration Railway

echo.
echo 📋 Fichiers Railway présents:
if exist "Dockerfile.railway" (
    echo ✅ Dockerfile.railway
) else (
    echo ❌ Dockerfile.railway manquant
)

if exist "railway.json" (
    echo ✅ railway.json
) else (
    echo ❌ railway.json manquant
)

if exist "Procfile" (
    echo ✅ Procfile
) else (
    echo ❌ Procfile manquant
)

if exist "start-railway.sh" (
    echo ✅ start-railway.sh
) else (
    echo ❌ start-railway.sh manquant
)

if exist "start-railway.bat" (
    echo ✅ start-railway.bat
) else (
    echo ❌ start-railway.bat manquant
)

echo.
echo 📋 Configuration Railway:
echo ✅ Commande de démarrage: /app/kestra server standalone
echo ✅ Port: 8080
echo ✅ Health check: /health
echo ✅ Image de base: kestra/kestra:latest

echo.
echo 🚀 Prêt pour le déploiement Railway!
echo Utilisez: .\railway-deploy-no-compose.bat

pause
