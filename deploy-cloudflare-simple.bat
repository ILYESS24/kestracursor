@echo off
echo 🚀 Déploiement simple sur Cloudflare

echo 📋 Installation de Wrangler (CLI Cloudflare)...
npm install -g wrangler

echo 📋 Connexion à Cloudflare...
wrangler login

echo ⬆️ Déploiement...
wrangler deploy

echo ✅ Déploiement terminé!
echo 🌐 Votre application est accessible sur Cloudflare

pause
