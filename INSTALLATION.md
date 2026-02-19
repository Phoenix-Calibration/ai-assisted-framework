# AIris Installation Guide

**Clear vision for AI-assisted development**

Quick guide to add AIris Framework to your project.

---

## Quick Install (Recommended)

### Option 1: Installation Script (Easiest)

**For Windows (PowerShell):**
```powershell
# Download and run the installer
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenix-Calibration/ai-assisted-framework/main/install-airis.ps1" -OutFile "install-airis.ps1"
.\install-airis.ps1
```

**For Linux/Mac (Bash):**
```bash
# Download and run the installer
curl -O https://raw.githubusercontent.com/Phoenix-Calibration/ai-assisted-framework/main/install-airis.sh
chmod +x install-airis.sh
./install-airis.sh
```

**What it does:**
- Checks if Git is installed
- Downloads AIris from GitHub
- Copies `.airis/` to your project root
- Cleans up temporary files
- Shows next steps

---

### Option 2: One-Line Command

**For Windows (PowerShell):**
```powershell
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis; Copy-Item -Path "temp-airis\.airis" -Destination "." -Recurse; Remove-Item -Path "temp-airis" -Recurse -Force
```

**For Linux/Mac (Bash):**
```bash
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis && cp -r temp-airis/.airis . && rm -rf temp-airis
```

---

### Option 3: Manual Download

1. Go to: https://github.com/Phoenix-Calibration/ai-assisted-framework
2. Click **"Code"** → **"Download ZIP"**
3. Extract the ZIP file
4. Copy the `.airis/` folder to your project root

---

## What You Get

After installation, your project will have:

```
your-project/
└── .airis/                          # Framework core (reusable across projects)
    ├── FRAMEWORK.md                   # Complete framework guide
    ├── templates/                     # Document templates
    │   ├── 0-PRD.template.md            # Product Requirements (optional)
    │   ├── 1-scope.template.md          # Vision, boundaries & features
    │   ├── 2-design.template.md         # Architecture & tech decisions
    │   ├── 3-tracker.template.md        # Task registry
    │   ├── 4-todo.template.md           # Session plan
    │   ├── 5-handoff.template.md        # Session state transfer
    │   └── 6-extraction.template.md     # CLAUDE.md / AGENTS.md extraction
    ├── prompts/                       # AI prompts
    │   ├── 1-discovery.prompt.md        # Generate PRD
    │   ├── 2-scope.prompt.md            # Generate Scope
    │   ├── 3-design.prompt.md           # Generate Design
    │   ├── 4-tracker.prompt.md          # Generate / update Tracker
    │   ├── 5-session.prompt.md          # Session lifecycle (Parts 0/1/2)
    │   └── 6-amendment.prompt.md        # Scope/design change management
    └── instructions/                  # Claude Project instructions
        └── airis-integration.instructions.md
```

Then create these folders in your project root:

```
your-project/
├── .ai-docs/                        # Your strategic documents
│   ├── scope.md                       # Vision, boundaries & features
│   ├── design.md                      # Architecture & constraints
│   └── tracker.md                     # Task registry
│
└── .ai-session/                     # Session execution & state
    └── {your-name}/                   # Per-developer workspace
        ├── current/
        │   ├── todo.md                  # Active session plan
        │   └── handoff.md              # Session state transfer
        └── archive/                   # Completed sessions
```

---

## Next Steps

### 1. Read the Documentation
```bash
# Open the main guide
cat .airis/FRAMEWORK.md
```

### 2. Create Your Strategic Documents (IN ORDER)

**For NEW projects:**
```
1. Create: .ai-docs/scope.md   — use .airis/prompts/2-scope.prompt.md
2. Create: .ai-docs/design.md  — use .airis/prompts/3-design.prompt.md
3. Generate: .ai-docs/tracker.md — use .airis/prompts/4-tracker.prompt.md
```

**For EXISTING projects:**
```
1. Document: Current architecture in .ai-docs/design.md (AS-IS + TO-BE)
2. Document: Current vision and features in .ai-docs/scope.md
3. Generate: .ai-docs/tracker.md — use .airis/prompts/4-tracker.prompt.md
```

### 3. Optional — Extract Tool-Specific Instructions
```bash
# Generate CLAUDE.md or AGENTS.md from your .ai-docs/
# Use: .airis/templates/6-extraction.template.md
# Input: .ai-docs/design.md + .ai-docs/scope.md
```

### 4. Start Your First Session
```bash
# Create your developer workspace
mkdir -p .ai-session/{your-name}/current
mkdir -p .ai-session/{your-name}/archive

# Use: .airis/prompts/5-session.prompt.md
# Part 0: "Create ToDo for T-001" → generates todo.md
# Part 1: "Start session" → adds Opening Brief
# Part 2: "Session complete" → generates Closing Report + handoff.md
```

---

## Updating AIris

To update to the latest version:

**Windows:**
```powershell
Remove-Item -Path ".airis" -Recurse -Force
.\install-airis.ps1
```

**Linux/Mac:**
```bash
rm -rf .airis
./install-airis.sh
```

**Note:** This overwrites `.airis/`. Your project docs live in `.ai-docs/` and `.ai-session/` — they are not affected.

---

## Pro Tips

### Use version control
```bash
# Commit AIris and your docs to your repo
git add .airis/ .ai-docs/ .ai-session/
git commit -m "docs: Add AIris framework"
```

### Team collaboration
- Everyone installs the same `.airis/` framework
- Strategic docs (`.ai-docs/`) are shared via git
- Each developer has an independent `.ai-session/{name}/` workspace
- Tracker conflicts (different tasks): keep both updates

---

## Troubleshooting

### "Git not found"
Install Git:
- Windows: https://git-scm.com/download/win
- Mac: `brew install git`
- Linux: `sudo apt-get install git` or `sudo dnf install git`

### ".airis folder not visible"
Folders starting with `.` are hidden:
- Windows: Enable "Show hidden files" in File Explorer
- Mac/Linux: Use `ls -la` to see hidden folders

### "Permission denied"
- Windows: Run PowerShell as Administrator
- Linux/Mac: Add `sudo` before commands if needed

### "Cannot download script"
Check your internet connection or download manually from:
https://github.com/Phoenix-Calibration/ai-assisted-framework

---

## Learn More

- **Full Documentation:** `.airis/FRAMEWORK.md`
- **Templates:** `.airis/templates/`
- **Prompts:** `.airis/prompts/`
- **Repository:** https://github.com/Phoenix-Calibration/ai-assisted-framework

---

## License

AIris Framework - Private - Phoenix Calibration

---

**See clearly. Build confidently.**
