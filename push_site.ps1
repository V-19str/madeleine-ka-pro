# Script SIMPLE pour pousser le site sur GitHub
# Le fichier index.html doit DEJA etre dans le dossier !

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  PUSH SITE MADELEINE KA" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Aller dans le bon dossier
$projectPath = "C:\Users\vladimir.streiff\Downloads\madeleine-ka-galerie\madeleine-ka-pro"
Set-Location $projectPath

# Verifier la taille du fichier
$file = Get-Item ".\index.html" -ErrorAction SilentlyContinue
if ($file) {
    Write-Host "Fichier trouve : index.html ($($file.Length) bytes)" -ForegroundColor Green
} else {
    Write-Host "ERREUR : index.html introuvable dans le dossier !" -ForegroundColor Red
    Read-Host "Appuyez sur Entree pour quitter"
    exit
}

Write-Host ""

# Etape 1 : git add
Write-Host "[1/3] Ajout du fichier a git..." -ForegroundColor Yellow
git add index.html
git add -A
Write-Host "  OK !" -ForegroundColor Green

# Etape 2 : git commit
Write-Host ""
Write-Host "[2/3] Commit..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMsg = "Mise a jour $timestamp"
git commit -m $commitMsg
Write-Host "  OK !" -ForegroundColor Green

# Etape 3 : git push
Write-Host ""
Write-Host "[3/3] Push vers GitHub..." -ForegroundColor Yellow
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
