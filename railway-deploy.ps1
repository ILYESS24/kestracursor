# Script PowerShell pour déploiement automatique Railway avec vérification Kestra

Write-Host "🚀 Déploiement automatique Railway avec vérification Kestra" -ForegroundColor Green

# Fonction de vérification Kestra
function Test-KestraHealth {
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:8081/health" -TimeoutSec 10 -UseBasicParsing
        return $response.StatusCode -eq 200
    }
    catch {
        return $false
    }
}

# Fonction de réparation automatique
function Repair-Kestra {
    Write-Host "🔧 Lancement de la réparation automatique..." -ForegroundColor Yellow
    & .\fix-kestra-docker.bat
    Start-Sleep -Seconds 30
}

# Vérification initiale
Write-Host "📋 Vérification de l'état actuel de Kestra..." -ForegroundColor Yellow
$kestraRunning = docker ps | Select-String "kestra"
if (-not $kestraRunning) {
    Write-Host "❌ Kestra n'est pas en cours d'exécution" -ForegroundColor Red
    Repair-Kestra
} else {
    Write-Host "✅ Kestra est en cours d'exécution" -ForegroundColor Green
}

# Test de l'API
if (-not (Test-KestraHealth)) {
    Write-Host "❌ API Kestra non accessible" -ForegroundColor Red
    Repair-Kestra
} else {
    Write-Host "✅ API Kestra accessible" -ForegroundColor Green
}

# Préparation du déploiement
Write-Host "📦 Préparation du déploiement..." -ForegroundColor Yellow
git add .

# Commit avec timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMessage = "Auto-deploy Railway: $timestamp"
Write-Host "💾 Création du commit: $commitMessage" -ForegroundColor Yellow
git commit -m $commitMessage

# Push vers GitHub (déclencheur Railway)
Write-Host "⬆️ Push vers GitHub (déclencheur Railway)..." -ForegroundColor Yellow
git push origin develop

# Attente du déploiement
Write-Host "⏳ Attente du déploiement Railway (60 secondes)..." -ForegroundColor Yellow
Start-Sleep -Seconds 60

# Vérification post-déploiement
Write-Host "🔍 Vérification post-déploiement..." -ForegroundColor Yellow
docker ps

# Test final de l'API
if (Test-KestraHealth) {
    Write-Host "✅ Déploiement réussi - Kestra opérationnel!" -ForegroundColor Green
} else {
    Write-Host "❌ Problème détecté après déploiement" -ForegroundColor Red
    Repair-Kestra
}

Write-Host "🌐 Kestra: http://localhost:8080" -ForegroundColor Cyan
Write-Host "🔍 Health: http://localhost:8081/health" -ForegroundColor Cyan
