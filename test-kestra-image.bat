@echo off
echo 🔍 Test de l'image Kestra pour Railway

echo.
echo 📋 Test 1: Vérification de l'image officielle
docker run --rm kestra/kestra:latest find / -name "kestra" -type f 2>nul

echo.
echo 📋 Test 2: Contenu de /app
docker run --rm kestra/kestra:latest ls -la /app/ 2>nul

echo.
echo 📋 Test 3: Contenu de /usr/local/bin
docker run --rm kestra/kestra:latest ls -la /usr/local/bin/ 2>nul

echo.
echo 📋 Test 4: Test de l'exécutable
docker run --rm kestra/kestra:latest /usr/local/bin/kestra --version 2>nul

echo.
echo ✅ Tests terminés!
echo 💡 Utilisez les résultats pour corriger le Dockerfile.railway

pause
