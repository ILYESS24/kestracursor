@echo off
echo 🔍 Surveillance automatique de Kestra avec réparation auto

:monitor_loop
echo.
echo ⏰ Vérification automatique - %date% %time%

REM Vérifier si Kestra est en cours d'exécution
docker ps | findstr kestra > nul
if %errorlevel% neq 0 (
    echo ❌ Kestra arrêté détecté!
    echo 🔧 Lancement de la réparation automatique...
    call .\fix-kestra-docker.bat
    goto continue_monitor
)

REM Vérifier l'API Kestra
curl -s http://localhost:8081/health > nul
if %errorlevel% neq 0 (
    echo ❌ API Kestra non accessible!
    echo 🔧 Redémarrage de Kestra...
    docker-compose restart kestra
    timeout /t 30 /nobreak > nul
    goto continue_monitor
)

REM Vérifier les logs pour des erreurs
docker logs kestracursor-1-kestra-1 --tail 5 | findstr "ERROR\|Exception\|Failed" > nul
if %errorlevel% equ 0 (
    echo ⚠️ Erreurs détectées dans les logs!
    echo 🔧 Redémarrage préventif...
    docker-compose restart kestra
    timeout /t 30 /nobreak > nul
    goto continue_monitor
)

echo ✅ Kestra fonctionne correctement

:continue_monitor
echo ⏳ Prochaine vérification dans 2 minutes...
timeout /t 120 /nobreak > nul
goto monitor_loop
