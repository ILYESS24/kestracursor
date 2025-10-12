# 🚀 Déploiement Automatique Railway avec Kestra

## 📋 Scripts de Déploiement Automatique

### 🔧 Scripts de Réparation
- **`fix-kestra-docker.bat`** - Réparation automatique de Kestra
- **`kestra-monitor.bat`** - Surveillance continue avec réparation auto

### 🚀 Scripts de Déploiement
- **`railway-deploy.bat`** - Déploiement Railway avec vérification
- **`railway-deploy.ps1`** - Version PowerShell avancée
- **`auto-deploy-railway.bat`** - Déploiement complet avec surveillance

## 🎯 Utilisation

### Déploiement Simple
```bash
.\railway-deploy.bat
```

### Déploiement Complet avec Surveillance
```bash
.\auto-deploy-railway.bat
```

### Surveillance Continue
```bash
.\kestra-monitor.bat
```

## 🔍 Fonctionnalités Automatiques

### ✅ Vérifications Automatiques
- État des conteneurs Docker
- Accessibilité de l'API Kestra
- Détection d'erreurs dans les logs
- Test de santé post-déploiement

### 🔧 Réparations Automatiques
- Redémarrage des conteneurs défectueux
- Suppression des images corrompues
- Téléchargement d'images officielles
- Configuration automatique

### 📊 Surveillance Continue
- Vérification toutes les 2 minutes
- Réparation automatique en cas de problème
- Logs détaillés des opérations
- Alertes en cas d'erreur

## 🌐 URLs de Vérification

- **Interface Kestra** : http://localhost:8080
- **API Health** : http://localhost:8081/health
- **Logs Docker** : `docker logs kestracursor-1-kestra-1`

## ⚙️ Configuration Railway

### Fichiers Railway :
- **`Dockerfile.railway`** - Dockerfile optimisé pour Railway
- **`railway.json`** - Configuration Railway complète
- **`Procfile`** - Alternative simple pour Railway
- **`start-railway.sh`** - Script de démarrage Linux
- **`start-railway.bat`** - Script de démarrage Windows

### Configuration :
- Commande de démarrage : `/app/kestra server standalone`
- Port : 8080
- Health check : `/health`
- Image de base : `kestra/kestra:latest`
- Pas de docker-compose requis

## 🚨 Résolution de Problèmes

### Erreur `/app/kestra: not found`
```bash
.\fix-kestra-docker.bat
```

### Erreur `docker-compose not found` sur Railway
```bash
.\railway-deploy-no-compose.bat
```

### Kestra non accessible
```bash
.\kestra-monitor.bat
```

### Déploiement échoué
```bash
.\auto-deploy-railway.bat
```

### Vérification Railway
```bash
.\railway-check.bat
```

## 📝 Logs et Monitoring

Tous les scripts génèrent des logs détaillés :
- État des conteneurs
- Tests de connectivité
- Erreurs détectées
- Actions de réparation

## 🔄 Workflow Automatique

1. **Vérification pré-déploiement** - Test de l'état actuel
2. **Réparation si nécessaire** - Correction automatique
3. **Déploiement** - Push vers GitHub/Railway
4. **Surveillance** - Vérification post-déploiement
5. **Réparation finale** - Si problème détecté

## 🎉 Avantages

- ✅ **Déploiement automatique** sans intervention manuelle
- ✅ **Réparation automatique** en cas de problème
- ✅ **Surveillance continue** 24/7
- ✅ **Vérifications multiples** pour garantir la stabilité
- ✅ **Logs détaillés** pour le debugging
- ✅ **Configuration Railway** optimisée
