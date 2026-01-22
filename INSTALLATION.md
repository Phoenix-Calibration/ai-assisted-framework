# AIris Installation Guide

**Clear vision for AI-assisted development**

Quick guide to add AIris Framework to your project.

---

## 🚀 Quick Install (Recommended)

### **Option 1: Installation Script (Easiest)**

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
- ✅ Checks if Git is installed
- ✅ Downloads AIris from GitHub
- ✅ Copies `.airis/` to your project root
- ✅ Cleans up temporary files
- ✅ Shows next steps

---

### **Option 2: One-Line Command**

**For Windows (PowerShell):**
```powershell
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis; Copy-Item -Path "temp-airis\.airis" -Destination "." -Recurse; Remove-Item -Path "temp-airis" -Recurse -Force
```

**For Linux/Mac (Bash):**
```bash
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis && cp -r temp-airis/.airis . && rm -rf temp-airis
```

---

### **Option 3: Manual Download**

1. Go to: https://github.com/Phoenix-Calibration/ai-assisted-framework
2. Click **"Code"** → **"Download ZIP"**
3. Extract the ZIP file
4. Copy the `.airis/` folder to your project root

---

## 📋 What You Get

After installation, your project will have:

```
your-project/
└── .airis/
    ├── FRAMEWORK.md                 # Complete framework guide
    ├── _setup/
    │   ├── templates/               # 7 document templates
    │   │   ├── 0-PRD.template.md
    │   │   ├── 1-scope.template.md
    │   │   ├── 2-requirements.template.md
    │   │   ├── 3-design.template.md
    │   │   ├── 4-tracker.template.md
    │   │   ├── 5-todo.template.md
    │   │   └── 6-handoff.template.md
    │   └── prompts/                 # 6 AI prompts
    │       ├── 1-discovery.prompt.md
    │       ├── 2-scope.prompt.md
    │       ├── 3-requirements.prompt.md
    │       ├── 4-design.prompt.md
    │       ├── 5-tracker.prompt.md
    │       └── 6-session.prompt.md
    ├── docs/                        # Placeholder examples
    │   ├── design.md
    │   ├── requirements.md
    │   ├── scope.md
    │   └── tracker.md
    └── session/                     # Session workspace
        └── README.md
```

---

## 🎯 Next Steps

### **1. Read the Documentation**
```bash
# Open the main guide
cat .airis/FRAMEWORK.md
# or open in your editor
```

### **2. Start with Phase 1: Strategic Documents**

Create your project's foundation documents:

**For NEW projects:**
```
1. Create: .airis/docs/scope.md (vision & boundaries)
2. Create: .airis/docs/requirements.md (features & stories)
3. Create: .airis/docs/design.md (architecture & constraints)
```

**For EXISTING projects:**
```
1. Document: Current architecture in design.md
2. Document: Current vision in scope.md
3. Document: Existing + planned features in requirements.md
```

### **3. Use AI Prompts as Guides**

Located in `.airis/_setup/prompts/`:
- Use them to generate your documents
- Copy them into your AI chat
- Follow the structured approach

---

## 🔄 Updating AIris

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

**Note:** This will overwrite `.airis/`. Your project docs should be in your own folders, not in `.airis/`.

---

## 💡 Pro Tips

### **Customize for Your Project**

1. **Copy templates to your docs folder:**
   ```bash
   # Example: Create your design document
   cp .airis/_setup/templates/3-design.template.md docs/design.md
   ```

2. **Use version control:**
   ```bash
   # Commit AIris to your repo
   git add .airis/
   git commit -m "docs: Add AIris framework"
   ```

3. **Team collaboration:**
   - Everyone gets the same framework
   - Shared understanding of process
   - Consistent documentation structure

---

## 🛠️ Troubleshooting

### **"Git not found"**
Install Git:
- Windows: https://git-scm.com/download/win
- Mac: `brew install git`
- Linux: `sudo apt-get install git` or `sudo dnf install git`

### **".airis folder not visible"**
Folders starting with `.` are hidden:
- Windows: Enable "Show hidden files" in File Explorer
- Mac/Linux: Use `ls -la` to see hidden folders

### **"Permission denied"**
- Windows: Run PowerShell as Administrator
- Linux/Mac: Add `sudo` before commands if needed

### **"Cannot download script"**
Check your internet connection or download manually from:
https://github.com/Phoenix-Calibration/ai-assisted-framework

---

## 📚 Learn More

- **Full Documentation:** `.airis/FRAMEWORK.md`
- **Framework Philosophy:** Constraint-first methodology
- **Templates:** `.airis/_setup/templates/`
- **Prompts:** `.airis/_setup/prompts/`
- **Repository:** https://github.com/Phoenix-Calibration/ai-assisted-framework

---

## 🆘 Need Help?

1. Check the framework guide: `.airis/FRAMEWORK.md`
2. Review the templates for examples
3. Read the prompts for guidance
4. Open an issue on GitHub

---

## 📄 License

AIris Framework - Private - Phoenix Calibration

---

**See clearly. Build confidently.** 👁️
