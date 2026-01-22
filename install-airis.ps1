#!/usr/bin/env pwsh
# AIris Framework - Installation Script for Windows
# Version: 1.0
# Usage: .\install-airis.ps1

Write-Host "🎯 AIris Framework Installer" -ForegroundColor Cyan
Write-Host "Clear vision for AI-assisted development" -ForegroundColor Gray
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git detected: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed. Please install Git first:" -ForegroundColor Red
    Write-Host "   https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Check if .airis already exists
if (Test-Path ".airis") {
    Write-Host "⚠️  .airis folder already exists in this project." -ForegroundColor Yellow
    $response = Read-Host "Do you want to overwrite it? (yes/no)"
    if ($response -ne "yes") {
        Write-Host "Installation cancelled." -ForegroundColor Gray
        exit 0
    }
    Write-Host "Removing existing .airis folder..." -ForegroundColor Yellow
    Remove-Item -Path ".airis" -Recurse -Force
}

Write-Host ""
Write-Host "📦 Downloading AIris Framework..." -ForegroundColor Cyan

# Clone the repository to a temporary folder
try {
    git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis-install 2>&1 | Out-Null
    Write-Host "✅ Repository cloned" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to clone repository" -ForegroundColor Red
    exit 1
}

# Copy .airis folder
Write-Host "📂 Installing AIris to your project..." -ForegroundColor Cyan
try {
    Copy-Item -Path "temp-airis-install\.airis" -Destination "." -Recurse -Force
    Write-Host "✅ AIris installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to copy files" -ForegroundColor Red
    Remove-Item -Path "temp-airis-install" -Recurse -Force -ErrorAction SilentlyContinue
    exit 1
}

# Clean up
Write-Host "🧹 Cleaning up..." -ForegroundColor Cyan
Remove-Item -Path "temp-airis-install" -Recurse -Force
Write-Host "✅ Cleanup complete" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 AIris Framework installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📖 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Read: .airis/FRAMEWORK.md for complete documentation" -ForegroundColor White
Write-Host "   2. Start with: .airis/_setup/templates/ for your project docs" -ForegroundColor White
Write-Host "   3. Use prompts: .airis/_setup/prompts/ for AI assistance" -ForegroundColor White
Write-Host ""
Write-Host "👁️  See clearly. Build confidently." -ForegroundColor Magenta
Write-Host ""
