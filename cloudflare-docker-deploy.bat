@echo off
echo 🚀 Déploiement Docker sur Cloudflare

echo 📋 Construction de l'image Docker...
docker build -f Dockerfile.cloudflare -t kestra-cloudflare .

echo 📋 Tag de l'image pour Cloudflare...
docker tag kestra-cloudflare your-registry/kestra-cloudflare:latest

echo ⬆️ Push vers Cloudflare Registry...
docker push your-registry/kestra-cloudflare:latest

echo ✅ Déploiement terminé!
echo 🌐 Votre application est accessible sur Cloudflare

pause
