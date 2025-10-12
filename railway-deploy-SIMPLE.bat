@echo off
echo 🚀 DÉPLOIEMENT SIMPLE - ÇA VA MARCHER !

railway deploy --service kestra --dockerfile Dockerfile.railway.SIMPLE

echo ✅ DÉPLOIEMENT TERMINÉ!
railway open

pause
