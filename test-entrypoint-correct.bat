@echo off
echo 🚀 Test de l'ENTRYPOINT correct

echo 📋 Test 1: Lancer avec CMD seulement
docker run --rm kestra/kestra:latest server standalone --help

echo.
echo ✅ Test terminé!

pause
