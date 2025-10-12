@echo off
echo 🔍 DEBUG de l'image Kestra officielle

echo.
echo 📋 Test 1: Lancer l'image et voir ce qu'il y a dedans
docker run --rm kestra/kestra:latest find / -name "*kestra*" -type f 2>nul

echo.
echo 📋 Test 2: Contenu de /app
docker run --rm kestra/kestra:latest ls -la /app/ 2>nul

echo.
echo 📋 Test 3: Contenu de /usr/local/bin
docker run --rm kestra/kestra:latest ls -la /usr/local/bin/ 2>nul

echo.
echo 📋 Test 4: Chercher les JAR
docker run --rm kestra/kestra:latest find / -name "*.jar" 2>nul

echo.
echo 📋 Test 5: L'entrypoint original
docker run --rm kestra/kestra:latest cat /usr/local/bin/docker-entrypoint.sh 2>nul

echo.
echo ✅ Debug terminé!

pause
