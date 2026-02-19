#!/bin/bash
# AIris Framework - Installation Script for Linux/Mac
# Version: 1.2
# Usage: ./install-airis.sh

echo "🎯 AIris Framework Installer"
echo "Clear vision for AI-assisted development"
echo ""

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first:"
    echo "   macOS: brew install git"
    echo "   Ubuntu/Debian: sudo apt-get install git"
    echo "   Fedora: sudo dnf install git"
    exit 1
fi

GIT_VERSION=$(git --version)
echo "✅ Git detected: $GIT_VERSION"

# Track whether this is a fresh install or an update
IS_UPDATE=false

AIRIS_SKILLS=("airis-session" "airis-tracker" "airis-amendment" "airis-issue")

# Check if .airis already exists
if [ -d ".airis" ]; then
    IS_UPDATE=true
    echo ""
    echo "⚠️  AIris is already installed in this project."
    echo "   This will UPDATE:"
    echo "     - .airis/                    (framework files)"
    echo "     - .claude/skills/airis-*     (Claude Code skills)"
    echo "   Your .ai-docs/ and .ai-session/ will NOT be affected."
    echo ""
    read -p "Update AIris framework? (yes/no): " response
    if [ "$response" != "yes" ]; then
        echo "Update cancelled."
        exit 0
    fi
    echo "Updating .airis/ folder..."
    rm -rf .airis
    echo "Updating Claude Code skills..."
    for skill in "${AIRIS_SKILLS[@]}"; do
        rm -rf ".claude/skills/$skill"
    done
fi

echo ""
echo "📦 Downloading AIris Framework..."

# Clone the repository to a temporary folder
if git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis-install > /dev/null 2>&1; then
    echo "✅ Repository cloned"
else
    echo "❌ Failed to clone repository"
    exit 1
fi

# Copy .airis folder
echo "📂 Installing AIris to your project..."
if cp -r temp-airis-install/.airis .; then
    echo "✅ .airis/ installed"
else
    echo "❌ Failed to copy .airis/"
    rm -rf temp-airis-install
    exit 1
fi

# Copy Claude Code skills
echo "⚙️  Installing Claude Code skills..."
mkdir -p ".claude/skills"
for skill in "${AIRIS_SKILLS[@]}"; do
    if cp -r "temp-airis-install/.claude/skills/$skill" ".claude/skills/"; then
        echo "   ✅ $skill"
    else
        echo "   ⚠️  Failed to copy $skill (skipping)"
    fi
done

# Clean up
echo "🧹 Cleaning up..."
rm -rf temp-airis-install
echo "✅ Cleanup complete"

# Create .ai-docs if not exists
if [ ! -d ".ai-docs" ]; then
    echo "📁 Creating .ai-docs/ folder..."
    mkdir -p .ai-docs
    echo "✅ .ai-docs/ created"
fi

# Create .ai-session if not exists
if [ ! -d ".ai-session" ]; then
    echo "📁 Creating .ai-session/ folder..."
    mkdir -p .ai-session
    echo "✅ .ai-session/ created"
fi

echo ""
if [ "$IS_UPDATE" = true ]; then
    echo "🔄 AIris Framework updated successfully!"
    echo ""
    echo "⚠️  Post-update checklist:"
    echo "   1. If you use CLAUDE.md or AGENTS.md, re-extract them:"
    echo "      Load: .airis/templates/6-extraction.template.md"
    echo "   2. Your .ai-docs/ and .ai-session/ are untouched — no action needed"
else
    echo "🎉 AIris Framework installed successfully!"
    echo ""
    echo "📖 Next steps:"
    echo "   1. Read: .airis/FRAMEWORK.md for complete documentation"
    echo "   2. Create: .ai-docs/scope.md and .ai-docs/design.md"
    echo "      Use prompts: .airis/prompts/2-scope.prompt.md and 3-design.prompt.md"
    echo "      Or with Claude Code: /airis-session, /airis-tracker, /airis-amendment, /airis-issue"
    echo "   3. Create your dev workspace: .ai-session/{your-name}/current/"
fi

echo ""
echo "👁️  See clearly. Build confidently."
echo ""
