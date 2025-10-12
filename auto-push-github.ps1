# Script PowerShell pour auto-push vers GitHub
# Exécute automatiquement: git add, commit, push

Write-Host "🚀 Auto-push vers GitHub - Tous les changements" -ForegroundColor Green

# Vérifier le statut Git
Write-Host "📋 Vérification du statut Git..." -ForegroundColor Yellow
git status

# Ajouter tous les fichiers modifiés
Write-Host "📁 Ajout de tous les changements..." -ForegroundColor Yellow
git add .

# Vérifier s'il y a des changements à commiter
$changes = git diff --cached --name-only
if ($changes.Count -gt 0) {
    # Créer un commit avec timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $commitMessage = "Auto-push: $timestamp"
    
    Write-Host "💾 Création du commit: $commitMessage" -ForegroundColor Yellow
    git commit -m $commitMessage
    
    # Pousser vers GitHub
    Write-Host "⬆️ Push vers GitHub..." -ForegroundColor Yellow
    git push origin develop
    
    Write-Host "✅ Push réussi vers GitHub!" -ForegroundColor Green
} else {
    Write-Host "ℹ️ Aucun changement à commiter. Repository à jour." -ForegroundColor Blue
}

# Afficher le statut final
Write-Host "📊 Statut final:" -ForegroundColor Cyan
git status --short

Write-Host "🎉 Script terminé!" -ForegroundColor Green
