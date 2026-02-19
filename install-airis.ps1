#!/usr/bin/env pwsh
# AIris Framework - Installation Script for Windows
# Version: 1.2
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

# Track whether this is a fresh install or an update
$isUpdate = $false

$airisSkills = @("airis-session", "airis-tracker", "airis-amendment", "airis-issue")

# Check if .airis already exists
if (Test-Path ".airis") {
    $isUpdate = $true
    Write-Host ""
    Write-Host "⚠️  AIris is already installed in this project." -ForegroundColor Yellow
    Write-Host "   This will UPDATE:" -ForegroundColor Yellow
    Write-Host "     - .airis/                    (framework files)" -ForegroundColor Gray
    Write-Host "     - .claude/skills/airis-*     (Claude Code skills)" -ForegroundColor Gray
    Write-Host "   Your .ai-docs/ and .ai-session/ will NOT be affected." -ForegroundColor Gray
    Write-Host ""
    $response = Read-Host "Update AIris framework? (yes/no)"
    if ($response -ne "yes") {
        Write-Host "Update cancelled." -ForegroundColor Gray
        exit 0
    }
    Write-Host "Updating .airis/ folder..." -ForegroundColor Yellow
    Remove-Item -Path ".airis" -Recurse -Force
    Write-Host "Updating Claude Code skills..." -ForegroundColor Yellow
    foreach ($skill in $airisSkills) {
        $skillPath = ".claude\skills\$skill"
        if (Test-Path $skillPath) {
            Remove-Item -Path $skillPath -Recurse -Force
        }
    }
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
    Write-Host "✅ .airis/ installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to copy .airis/" -ForegroundColor Red
    Remove-Item -Path "temp-airis-install" -Recurse -Force -ErrorAction SilentlyContinue
    exit 1
}

# Copy Claude Code skills
Write-Host "⚙️  Installing Claude Code skills..." -ForegroundColor Cyan
if (-not (Test-Path ".claude\skills")) {
    New-Item -ItemType Directory -Path ".claude\skills" -Force | Out-Null
}
foreach ($skill in $airisSkills) {
    try {
        Copy-Item -Path "temp-airis-install\.claude\skills\$skill" -Destination ".claude\skills\" -Recurse -Force
        Write-Host "   ✅ $skill" -ForegroundColor Green
    } catch {
        Write-Host "   ⚠️  Failed to copy $skill (skipping)" -ForegroundColor Yellow
    }
}

# Clean up
Write-Host "🧹 Cleaning up..." -ForegroundColor Cyan
Remove-Item -Path "temp-airis-install" -Recurse -Force
Write-Host "✅ Cleanup complete" -ForegroundColor Green

# Create .ai-docs if not exists
if (-not (Test-Path ".ai-docs")) {
    Write-Host "📁 Creating .ai-docs/ folder..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path ".ai-docs" | Out-Null
    Write-Host "✅ .ai-docs/ created" -ForegroundColor Green
}

# Create .ai-session if not exists
if (-not (Test-Path ".ai-session")) {
    Write-Host "📁 Creating .ai-session/ folder..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path ".ai-session" | Out-Null
    Write-Host "✅ .ai-session/ created" -ForegroundColor Green
}

Write-Host ""
if ($isUpdate) {
    Write-Host "🔄 AIris Framework updated successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "⚠️  Post-update checklist:" -ForegroundColor Yellow
    Write-Host "   1. If you use CLAUDE.md or AGENTS.md, re-extract them:" -ForegroundColor White
    Write-Host "      Load: .airis/templates/6-extraction.template.md" -ForegroundColor White
    Write-Host "   2. Your .ai-docs/ and .ai-session/ are untouched — no action needed" -ForegroundColor White
} else {
    Write-Host "🎉 AIris Framework installed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📖 Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Read: .airis/FRAMEWORK.md for complete documentation" -ForegroundColor White
    Write-Host "   2. Create: .ai-docs/scope.md and .ai-docs/design.md" -ForegroundColor White
    Write-Host "      Use prompts: .airis/prompts/2-scope.prompt.md and 3-design.prompt.md" -ForegroundColor White
    Write-Host "      Or with Claude Code: /airis-session, /airis-tracker, /airis-amendment, /airis-issue" -ForegroundColor White
    Write-Host "   3. Create your dev workspace: .ai-session/{your-name}/current/" -ForegroundColor White
}

Write-Host ""
Write-Host "👁️  See clearly. Build confidently." -ForegroundColor Magenta
Write-Host ""
