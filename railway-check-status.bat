@echo off
echo 🚀 Vérification du statut Kestra sur Railway

echo 📋 Vérification de l'URL Railway...
railway open

echo ⏳ Attente de 30 secondes pour que Kestra démarre complètement...
timeout /t 30 /nobreak > nul

echo 📊 Vérification des logs Railway...
railway logs --tail 20

echo ✅ Vérification terminée!
echo 🌐 Kestra devrait être accessible sur l'URL Railway
echo 💡 Le warning PrometheusMeterRegistry n'est pas grave

pause
