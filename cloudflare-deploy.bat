@echo off
echo 🚀 Déploiement sur Cloudflare

echo 📋 Vérification de l'authentification Cloudflare...
wrangler whoami

if %errorlevel% neq 0 (
    echo 🚨 Non connecté à Cloudflare. Veuillez vous connecter:
    wrangler login
    pause
    exit /b 1
)

echo ⬆️ Déploiement sur Cloudflare...
wrangler deploy

if %errorlevel% neq 0 (
    echo ❌ Erreur lors du déploiement sur Cloudflare.
    pause
    exit /b 1
)

echo ✅ Déploiement Cloudflare terminé!
echo 🌐 Votre application est maintenant accessible sur Cloudflare

pause
