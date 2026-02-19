#!/usr/bin/env node
/**
 * AIris Framework - NPM Installer
 * Version: 1.1
 * Usage: npx install-airis (when published) or node install-airis-npm.js
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const readline = require('readline');

const colors = {
  cyan: '\x1b[36m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  magenta: '\x1b[35m',
  gray: '\x1b[90m',
  white: '\x1b[37m',
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

function prompt(question) {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  return new Promise(resolve => {
    rl.question(question, answer => {
      rl.close();
      resolve(answer.trim().toLowerCase());
    });
  });
}

async function main() {
  log('🎯 AIris Framework Installer', 'cyan');
  log('Clear vision for AI-assisted development', 'gray');
  log('');

  // Check if Git is installed
  if (!exec('git --version')) {
    log('❌ Git is not installed. Please install Git first:', 'red');
    log('   https://git-scm.com/downloads', 'yellow');
    process.exit(1);
  }
  log('✅ Git detected', 'green');

  // Track whether this is a fresh install or an update
  let isUpdate = false;
  const airisPath = path.join(process.cwd(), '.airis');

  // Check if .airis already exists
  if (fs.existsSync(airisPath)) {
    isUpdate = true;
    log('');
    log('⚠️  AIris is already installed in this project.', 'yellow');
    log('   This will UPDATE .airis/ (framework files only).', 'yellow');
    log('   Your .ai-docs/ and .ai-session/ will NOT be affected.', 'gray');
    log('');
    const response = await prompt('Update AIris framework? (yes/no): ');
    if (response !== 'yes') {
      log('Update cancelled.', 'gray');
      process.exit(0);
    }
    log('Updating .airis/ folder...', 'yellow');
    fs.rmSync(airisPath, { recursive: true, force: true });
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
    if (fs.existsSync(tempDir)) {
      fs.rmSync(tempDir, { recursive: true, force: true });
    }
    process.exit(1);
  }

  // Clean up
  log('🧹 Cleaning up...', 'cyan');
  fs.rmSync(tempDir, { recursive: true, force: true });
  log('✅ Cleanup complete', 'green');

  // Create .ai-docs if not exists
  const aiDocsPath = path.join(process.cwd(), '.ai-docs');
  if (!fs.existsSync(aiDocsPath)) {
    log('📁 Creating .ai-docs/ folder...', 'cyan');
    fs.mkdirSync(aiDocsPath, { recursive: true });
    log('✅ .ai-docs/ created', 'green');
  }

  // Create .ai-session if not exists
  const aiSessionPath = path.join(process.cwd(), '.ai-session');
  if (!fs.existsSync(aiSessionPath)) {
    log('📁 Creating .ai-session/ folder...', 'cyan');
    fs.mkdirSync(aiSessionPath, { recursive: true });
    log('✅ .ai-session/ created', 'green');
  }

  log('');
  if (isUpdate) {
    log('🔄 AIris Framework updated successfully!', 'green');
    log('');
    log('⚠️  Post-update checklist:', 'yellow');
    log('   1. If you use CLAUDE.md or AGENTS.md, re-extract them:', 'white');
    log('      Load: .airis/templates/6-extraction.template.md', 'white');
    log('   2. Your .ai-docs/ and .ai-session/ are untouched — no action needed', 'white');
  } else {
    log('🎉 AIris Framework installed successfully!', 'green');
    log('');
    log('📖 Next steps:', 'cyan');
    log('   1. Read: .airis/FRAMEWORK.md for complete documentation', 'white');
    log('   2. Create: .ai-docs/scope.md and .ai-docs/design.md', 'white');
    log('      Use prompts: .airis/prompts/2-scope.prompt.md and 3-design.prompt.md', 'white');
    log('   3. Create your dev workspace: .ai-session/{your-name}/current/', 'white');
  }

  log('');
  log('👁️  See clearly. Build confidently.', 'magenta');
  log('');
}

main();
