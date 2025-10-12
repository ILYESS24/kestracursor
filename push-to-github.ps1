# Script pour pousser automatiquement vers GitHub

Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Green

# Vérifier le statut Git
Write-Host "📋 Checking Git status..." -ForegroundColor Yellow
git status

# Ajouter tous les fichiers modifiés
Write-Host "📁 Adding all changes..." -ForegroundColor Yellow
git add .

# Vérifier s'il y a des changements à commiter
$changes = git diff --cached --name-only
if ($changes.Count -gt 0) {
    # Créer un commit avec timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $commitMessage = "Auto-commit: $timestamp"
    
    Write-Host "💾 Committing changes: $commitMessage" -ForegroundColor Yellow
    git commit -m $commitMessage
    
    # Pousser vers GitHub
    Write-Host "⬆️ Pushing to GitHub..." -ForegroundColor Yellow
    git push origin develop
    
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
} else {
    Write-Host "ℹ️ No changes to commit. Repository is up to date." -ForegroundColor Blue
}

# Afficher le statut final
Write-Host "📊 Final status:" -ForegroundColor Cyan
git status --short