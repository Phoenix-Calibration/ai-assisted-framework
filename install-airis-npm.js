#!/usr/bin/env node
/**
 * AIris Framework - NPM Installer
 * Version: 1.0
 * Usage: npx install-airis (when published) or node install-airis-npm.js
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const colors = {
  cyan: '\x1b[36m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  magenta: '\x1b[35m',
  gray: '\x1b[90m',
  reset: '\x1b[0m'
};

function log(message, color = 'reset') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function exec(command) {
  try {
    execSync(command, { stdio: 'pipe' });
    return true;
  } catch (error) {
    return false;
  }
}

log('🎯 AIris Framework Installer', 'cyan');
log('Clear vision for AI-assisted development', 'gray');
log('');

// Check if Git is installed
log('Checking prerequisites...', 'cyan');
if (!exec('git --version')) {
  log('❌ Git is not installed. Please install Git first:', 'red');
  log('   https://git-scm.com/downloads', 'yellow');
  process.exit(1);
}
log('✅ Git detected', 'green');

// Check if .airis already exists
const airisPath = path.join(process.cwd(), '.airis');
if (fs.existsSync(airisPath)) {
  log('⚠️  .airis folder already exists in this project.', 'yellow');
  log('Installation cancelled. Remove .airis first if you want to reinstall.', 'gray');
  process.exit(0);
}

log('');
log('📦 Downloading AIris Framework...', 'cyan');

// Clone the repository
const tempDir = path.join(process.cwd(), 'temp-airis-install');
if (!exec('git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis-install')) {
  log('❌ Failed to clone repository', 'red');
  process.exit(1);
}
log('✅ Repository cloned', 'green');

// Copy .airis folder
log('📂 Installing AIris to your project...', 'cyan');
const sourcePath = path.join(tempDir, '.airis');
try {
  fs.cpSync(sourcePath, airisPath, { recursive: true });
  log('✅ AIris installed', 'green');
} catch (error) {
  log('❌ Failed to copy files', 'red');
  log(`Error: ${error.message}`, 'red');
  
  // Cleanup on failure
  if (fs.existsSync(tempDir)) {
    fs.rmSync(tempDir, { recursive: true, force: true });
  }
  process.exit(1);
}

// Clean up
log('🧹 Cleaning up...', 'cyan');
fs.rmSync(tempDir, { recursive: true, force: true });
log('✅ Cleanup complete', 'green');

log('');
log('🎉 AIris Framework installed successfully!', 'green');
log('');
log('📖 Next steps:', 'cyan');
log('   1. Read: .airis/FRAMEWORK.md for complete documentation');
log('   2. Start with: .airis/_setup/templates/ for your project docs');
log('   3. Use prompts: .airis/_setup/prompts/ for AI assistance');
log('');
log('👁️  See clearly. Build confidently.', 'magenta');
log('');
