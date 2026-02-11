# Dotfiles – Arch Linux Configuration

## 🎯 Overview

These dotfiles serve as a complete system configuration setup for Arch Linux users using the **Linux kernel** and **NVIDIA drivers** (not compatible with `linux-lts`). This is more than a rice or aesthetic setup—think of it as a `nix.config` for Arch. It provides a fully configured, ready-to-use workflow and development environment.

> ⚠️ **Important:** This setup is tailored **exclusively for Arch Linux** with the **standard `linux` kernel** and **NVIDIA graphics**. Do **not** use it with `linux-lts`.

## 🖥️ Preview

| Idle | Working |
|------|---------|
| ![Idle Screenshot](/Preview/idle.png) | ![Working Screenshot](/Preview/working.png) |

## 🧩 Features

- Pre-configured window manager
- Development tools and language runtimes
- Terminal and shell enhancements
- Theming and UI customizations
- Performance and power tweaks for NVIDIA GPU

## ⚙️ Installation

> 📝 **Note:** This script is intended to be used **after** a fresh Arch Linux installation.

### ✅ Requirements

- Fresh Arch Linux install
- `linux` kernel (not `linux-lts`)
- NVIDIA GPU and drivers
- Internet connection

### 📦 Install Script

**Current Version:** `5.4.6 - Auto Installer`

```bash
git clone https://github.com/BIGBEASTISHANK/dotfiles
cd dotfiles
echo 7f536624883dd33bc62975babbd4495ee32ee3c13bb2c312847e466677592852 syscopy.sh | sha256sum -c
chmod +x ./syscopy.sh
./syscopy.sh --install-extras=false
```

This will install:
- Window manager and UI setup
- Terminal, shell, and editor configurations
- Development environment and utilities
- Custom scripts and aliases

## 📎 Notes

- Do **not** run this script on an existing or modified Arch setup.
- Designed to provide a consistent workflow across machines.
- Think of this as a reproducible environment for power users.

