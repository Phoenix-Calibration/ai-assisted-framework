#!/bin/bash
# AIris Framework - Installation Script for Linux/Mac
# Version: 1.0
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

# Check if .airis already exists
if [ -d ".airis" ]; then
    echo "⚠️  .airis folder already exists in this project."
    read -p "Do you want to overwrite it? (yes/no): " response
    if [ "$response" != "yes" ]; then
        echo "Installation cancelled."
        exit 0
    fi
    echo "Removing existing .airis folder..."
    rm -rf .airis
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
    echo "✅ AIris installed"
else
    echo "❌ Failed to copy files"
    rm -rf temp-airis-install
    exit 1
fi

# Clean up
echo "🧹 Cleaning up..."
rm -rf temp-airis-install
echo "✅ Cleanup complete"

echo ""
echo "🎉 AIris Framework installed successfully!"
echo ""
echo "📖 Next steps:"
echo "   1. Read: .airis/README.md for complete documentation"
echo "   2. Start with: .airis/_setup/templates/ for your project docs"
echo "   3. Use prompts: .airis/_setup/prompts/ for AI assistance"
echo ""
echo "👁️  See clearly. Build confidently."
echo ""
