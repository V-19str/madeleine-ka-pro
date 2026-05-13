# Script automatique pour mettre à jour le site Madeleine Ka
# Double-clique sur ce fichier pour tout faire en 1 clic !

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  MISE A JOUR SITE MADELEINE KA" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Aller dans le bon dossier
$projectPath = "C:\Users\vladimir.streiff\Downloads\madeleine-ka-galerie\madeleine-ka-pro"
Set-Location $projectPath

# Etape 1 : Copier le nouveau fichier depuis Downloads
Write-Host "[1/4] Copie du nouveau index.html depuis Downloads..." -ForegroundColor Yellow
$source = "$env:USERPROFILE\Downloads\index.html"
$dest = ".\index.html"

if (Test-Path $source) {
    Copy-Item $source -Destination $dest -Force
    $fileSize = (Get-Item $dest).Length
    Write-Host "  OK ! Fichier copie ($fileSize bytes)" -ForegroundColor Green
} else {
    Write-Host "  ERREUR : index.html introuvable dans Downloads !" -ForegroundColor Red
    Write-Host "  Telechargez d'abord le nouveau fichier depuis Claude" -ForegroundColor Red
    Read-Host "Appuyez sur Entree pour quitter"
    exit
}

# Etape 2 : git add
Write-Host ""
Write-Host "[2/4] Ajout du fichier a git..." -ForegroundColor Yellow
git add index.html
Write-Host "  OK !" -ForegroundColor Green

# Etape 3 : git commit
Write-Host ""
Write-Host "[3/4] Commit..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMsg = "Mise a jour site $timestamp"
git commit -m $commitMsg
Write-Host "  OK !" -ForegroundColor Green

# Etape 4 : git push
Write-Host ""
Write-Host "[4/4] Push vers GitHub..." -ForegroundColor Yellow
git push
Write-Host "  OK !" -ForegroundColor Green

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host "  TERMINE ! Vercel va deployer..." -ForegroundColor Green
Write-Host "  Site : https://madeleine-ka-pro.vercel.app" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""
Write-Host "Attendez 1-2 minutes puis rechargez le site (Ctrl+F5)" -ForegroundColor Cyan
Write-Host ""
Read-Host "Appuyez sur Entree pour quitter"
