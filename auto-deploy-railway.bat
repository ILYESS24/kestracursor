@echo off
echo 🚀 Déploiement automatique Railway avec vérification complète

echo 📋 Étape 1: Vérification pré-déploiement
call .\fix-kestra-docker.bat

echo.
echo 📋 Étape 2: Test de fonctionnement
timeout /t 30 /nobreak > nul
curl -s http://localhost:8081/health > nul
if %errorlevel% neq 0 (
    echo ❌ Kestra non accessible avant déploiement
    echo 🔧 Nouvelle tentative de réparation...
    call .\fix-kestra-docker.bat
    timeout /t 30 /nobreak > nul
)

echo.
echo 📋 Étape 3: Préparation du déploiement
git add .
git commit -m "Auto-deploy Railway: %date% %time%"

echo.
echo 📋 Étape 4: Déploiement sur Railway
git push origin develop

echo.
echo 📋 Étape 5: Surveillance post-déploiement
echo ⏳ Attente du déploiement (90 secondes)...
timeout /t 90 /nobreak > nul

echo.
echo 📋 Étape 6: Vérification finale
docker ps
curl -s http://localhost:8081/health > nul
if %errorlevel% equ 0 (
    echo ✅ Déploiement réussi - Kestra opérationnel!
) else (
    echo ❌ Problème détecté - Relancement de la réparation...
    call .\fix-kestra-docker.bat
)

echo.
echo 🎉 Déploiement terminé!
echo 🌐 Kestra: http://localhost:8080
echo 🔍 Health: http://localhost:8081/health

echo.
echo 💡 Pour surveillance continue: .\kestra-monitor.bat
pause
