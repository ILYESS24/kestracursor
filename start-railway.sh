#!/bin/bash
# Script de démarrage pour Railway

echo "🚀 Démarrage de Kestra sur Railway..."

# Vérifier si Kestra est déjà en cours d'exécution
if pgrep -f "kestra" > /dev/null; then
    echo "✅ Kestra est déjà en cours d'exécution"
    exit 0
fi

# Démarrer Kestra directement
echo "📦 Démarrage de Kestra..."
exec /app/kestra server standalone
