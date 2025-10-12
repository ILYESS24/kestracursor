@echo off
echo 🚀 Test de l'image officielle Kestra

echo 📋 Test 1: Lancer l'image officielle avec la commande simple
docker run --rm kestra/kestra:latest server standalone --help

echo.
echo 📋 Test 2: Lancer l'image officielle avec la commande par défaut
docker run --rm kestra/kestra:latest --help

echo.
echo ✅ Test terminé!

pause
