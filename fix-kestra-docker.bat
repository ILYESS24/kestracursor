@echo off
echo 🔧 Script de réparation automatique de Kestra Docker

echo 📋 Vérification du statut des conteneurs...
docker ps -a

echo.
echo 🛑 Arrêt des conteneurs défectueux...
docker-compose down

echo.
echo 🧹 Nettoyage des images corrompues...
docker rmi kestra/kestra:latest 2>nul

echo.
echo 🚀 Redémarrage avec l'image officielle...
docker-compose up -d

echo.
echo ⏳ Attente du démarrage (30 secondes)...
timeout /t 30 /nobreak > nul

echo.
echo 📊 Vérification du statut final...
docker ps

echo.
echo 📝 Vérification des logs Kestra...
docker logs kestracursor-1-kestra-1 --tail 5

echo.
echo ✅ Réparation terminée!
echo 🌐 Kestra accessible sur: http://localhost:8080
echo 🔍 Health check: http://localhost:8081/health

pause
