@echo off
echo 🚀 DÉPLOIEMENT avec PORT 8080 - ÇA VA MARCHER !

railway deploy --service kestra --dockerfile Dockerfile.railway.PORT

echo ✅ DÉPLOIEMENT TERMINÉ!
railway open

pause
