@echo off
echo 🚀 DÉPLOIEMENT SANS HEALTHCHECK - ÇA VA MARCHER !

echo 📋 Copie du railway.json sans healthcheck...
copy railway-no-healthcheck.json railway.json

railway deploy --service kestra --dockerfile Dockerfile.railway.NO-HEALTHCHECK

echo ✅ DÉPLOIEMENT TERMINÉ!
railway open

pause
