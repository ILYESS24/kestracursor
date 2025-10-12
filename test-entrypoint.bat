@echo off
echo 🚀 Test de l'ENTRYPOINT de l'image officielle

echo 📋 Test 1: Lancer avec l'ENTRYPOINT et --help
docker run --rm kestra/kestra:latest /usr/local/bin/docker-entrypoint.sh --help

echo.
echo 📋 Test 2: Lancer avec l'ENTRYPOINT et server standalone --help
docker run --rm kestra/kestra:latest /usr/local/bin/docker-entrypoint.sh server standalone --help

echo.
echo ✅ Test terminé!

pause
