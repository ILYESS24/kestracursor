@echo off
echo 🔍 Test des Dockerfiles Railway

echo.
echo 📋 Test 1: Construction du Dockerfile.railway.WORKING
docker build -f Dockerfile.railway.WORKING -t kestra-test-working .

echo.
echo 📋 Test 2: Vérification de l'exécutable
docker run --rm kestra-test-working ls -la /app/bin/kestra

echo.
echo 📋 Test 3: Test de version
docker run --rm kestra-test-working /app/bin/kestra --version

echo.
echo ✅ Tests terminés!
echo 💡 Si ça marche, utilisez Dockerfile.railway.WORKING sur Railway

pause
