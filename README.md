<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/OpenRCT2_logo.svg/960px-OpenRCT2_logo.svg.png?_=20230905044308" width="200" height="auto">

  # OpenRCT2 Cross-Platform Portable USB Launcher

</div>

Cross-platform portable launcher and installer generator for **OpenRCT2** on **Windows, macOS, and Linux**.

This project now uses a small Python generator:

```text
generate.py
```

On Windows, users can run the included batch file, which executes:

```batch
py generate.py
```

The generator creates the full portable USB launcher suite, including Windows VBS launch automation, Windows installer/update scripts, Linux shell scripts, macOS shell scripts, setup instructions, and a ready-to-copy ZIP package.

Licensed under the **MIT License**.

---

## ✅ What This Project Does

This repository does **not** ship OpenRCT2 itself and does **not** ship RollerCoaster Tycoon game assets.

Instead, it generates a portable helper suite for users who want their OpenRCT2 setup to live on a USB drive.

The generated suite can help with:

- Windows portable OpenRCT2 install/update from GitHub releases
- Windows dynamic USB launcher using `usb_scanner.vbs`
- Windows logging to `logs/latest.log`
- Windows log archiving to `logs/archive/`
- Linux OpenRCT2 AppImage install/update helper
- macOS OpenRCT2 `.app` install/update helper
- portable `data/` folder support
- keeping saves, plugins, configs, and legal game files self-contained on the USB drive

---

## 🐍 Python Requirement

To generate the launcher suite, the user needs **Python installed**.

### Windows

Install the latest Python version from:

```text
https://www.python.org/downloads/
```

During installation, make sure Python is available through the Windows Python launcher command:

```batch
py
```

You can test it in Command Prompt:

```batch
py --version
```

If that works, you can run the generator with:

```batch
py generate.py
```

---

## 🚀 Quick Start

### Option 1: Use the Batch File on Windows

1. Download or clone this repository.
2. Install Python if you do not already have it.
3. Double-click the included batch file:

```text
[Generate] OpenRCT2 Portable Suite.bat
```

That batch file runs:

```batch
py generate.py
```

4. After generation, you will get:

```text
OpenRCT2_Portable_Suite/
OpenRCT2_Portable_Setup_Guide.zip
```

5. Copy the generated suite to your USB drive.

---

### Option 2: Run the Generator Manually

Open a terminal or Command Prompt in the repository folder and run:

```batch
py generate.py
```

On Linux/macOS, you can usually run:

```bash
python3 generate.py
```

---

## 📁 Repository Layout

The source repository should look like this:

```text
OpenRCT2_Universal_Auto_USB_Launchers/
├── generate.py
├── [Generate] OpenRCT2 Portable Suite.bat
├── README.md
├── LICENSE
└── screenshots/
    └── optional images
```

After running the generator, it creates:

```text
OpenRCT2_Universal_Auto_USB_Launchers/
├── generate.py
├── [Generate] OpenRCT2 Portable Suite.bat
├── OpenRCT2_Portable_Suite/
└── OpenRCT2_Portable_Setup_Guide.zip
```

---

## 📦 Generated Suite Layout

The generated portable suite looks like this:

```text
OpenRCT2_Portable_Suite/
├── README.txt
├── Windows/
│   ├── [Install - UPDATE] OpenRCT2.bat
│   ├── usb_scanner.vbs
│   ├── event_filter.xml
│   └── SETUP_INSTRUCTIONS.txt
├── Linux/
│   ├── install_update_openrct2.sh
│   ├── usb_scanner.sh
│   ├── 99-openrct2.rules
│   └── SETUP_INSTRUCTIONS.txt
└── macOS/
    ├── install_update_openrct2.sh
    ├── usb_scanner.sh
    ├── com.goi.usbscanner.plist
    └── SETUP_INSTRUCTIONS.txt
```

---

## 💾 Recommended USB Layout

After installing OpenRCT2 and adding your legal game files, your USB drive should look like this:

```text
OpenRCT2_USB/
├── data/
│   ├── rct1/               <-- Optional: your legal original RollerCoaster Tycoon 1 files
│   ├── rct2/               <-- Required: your legal original RollerCoaster Tycoon 2 files
│   ├── save/               <-- Portable save games
│   ├── plugin/             <-- Portable custom plugins
│   └── config.ini          <-- Portable OpenRCT2 configuration
├── logs/
│   ├── latest.log
│   └── archive/
├── updated.txt             <-- Windows installed version marker
├── updated-linux.txt       <-- Linux installed version marker
├── updated-macos.txt       <-- macOS installed version marker
├── openrct2.exe            <-- Windows portable executable after install/update
├── OpenRCT2.AppImage       <-- Linux AppImage after install/update
├── OpenRCT2.app/           <-- macOS app after install/update
├── Windows/
├── Linux/
└── macOS/
```

Recommended USB label:

```text
OpenRCT2_USB
```

The Windows VBS launcher also accepts:

```text
OpenRCT2 USB
```

---

## ⚠️ Important Legal Note

The `data/rct1` and `data/rct2` folders are for your own legally obtained RollerCoaster Tycoon game files.

These files are **not included** in this repository.

This project only provides launcher, installer, updater, and helper scripts. You must provide your own legal retail files.

---

## 🪟 Windows Setup

### 1. Generate the Suite

Run:

```batch
[Generate] OpenRCT2 Portable Suite.bat
```

or manually:

```batch
py generate.py
```

### 2. Copy the Generated Suite to USB

Copy this folder to your USB drive:

```text
OpenRCT2_Portable_Suite/
```

You can also extract/copy the contents of:

```text
OpenRCT2_Portable_Setup_Guide.zip
```

### 3. Install or Update OpenRCT2 Portable

On the USB drive, run:

```text
Windows/[Install - UPDATE] OpenRCT2.bat
```

This downloads the latest Windows portable x64 release from GitHub and extracts it to the USB root.

It creates/updates:

```text
openrct2.exe
updated.txt
data/
```

### 4. Manual Launch

From the USB root:

```batch
openrct2.exe --user-data-path=.\data
```

### 5. Automatic Launch with VBS

The generated Windows VBS launcher is:

```text
Windows/usb_scanner.vbs
```

This script:

- finds the USB dynamically
- does not assume a fixed drive letter like `E:\`
- accepts the USB labels `OpenRCT2_USB` and `OpenRCT2 USB`
- falls back to searching ready drives for `openrct2.exe`
- creates `data/` if missing
- writes logs to `logs/latest.log`
- archives old logs to `logs/archive/`
- writes a fallback log to `%TEMP%` if the USB cannot be found

### 6. Optional Windows Task Scheduler Trigger

You can set up Windows Task Scheduler to run `usb_scanner.vbs` when a USB/storage device is inserted.

Use the included:

```text
Windows/event_filter.xml
```

The event filter targets:

```text
Microsoft-Windows-Partition/Diagnostic
EventID=1006
```

Task action example:

```text
Program/script:
wscript.exe

Arguments:
"X:\Windows\usb_scanner.vbs"
```

Replace `X:` with the actual location where you placed the VBS file.

---

## 🍏 macOS Setup

### 1. Generate the Suite

On macOS, run:

```bash
python3 generate.py
```

### 2. Copy the Generated Suite to USB

Copy the generated files to a USB drive named:

```text
OpenRCT2_USB
```

### 3. Install or Update OpenRCT2

Run:

```bash
chmod +x macOS/install_update_openrct2.sh
./macOS/install_update_openrct2.sh
```

The updater downloads the latest macOS universal ZIP release and installs:

```text
OpenRCT2.app
updated-macos.txt
data/
```

### 4. Manual Launch

You can open:

```text
OpenRCT2.app
```

or use the generated launcher:

```bash
chmod +x macOS/usb_scanner.sh
./macOS/usb_scanner.sh
```

### 5. Optional LaunchAgent

The generated suite includes:

```text
macOS/com.goi.usbscanner.plist
```

Install it with:

```bash
cp macOS/usb_scanner.sh /usr/local/bin/usb_scanner.sh
chmod +x /usr/local/bin/usb_scanner.sh
cp macOS/com.goi.usbscanner.plist ~/Library/LaunchAgents/com.goi.usbscanner.plist
launchctl load ~/Library/LaunchAgents/com.goi.usbscanner.plist
```

To unload it:

```bash
launchctl unload ~/Library/LaunchAgents/com.goi.usbscanner.plist
```

---

## 🐧 Linux Setup

### 1. Generate the Suite

On Linux, run:

```bash
python3 generate.py
```

### 2. Copy the Generated Suite to USB

Use a USB drive named:

```text
OpenRCT2_USB
```

### 3. Install or Update OpenRCT2

Run:

```bash
chmod +x Linux/install_update_openrct2.sh
./Linux/install_update_openrct2.sh
```

The updater downloads the latest Linux x86_64 AppImage and installs:

```text
OpenRCT2.AppImage
openrct2
updated-linux.txt
data/
```

The `openrct2` file is a helper symlink to the AppImage when supported by the filesystem.

### 4. Manual Launch

Run:

```bash
./OpenRCT2.AppImage --user-data-path="./data"
```

or:

```bash
chmod +x Linux/usb_scanner.sh
./Linux/usb_scanner.sh
```

### 5. Optional udev Rule

The generated suite includes:

```text
Linux/99-openrct2.rules
```

Install it with:

```bash
sudo cp Linux/usb_scanner.sh /usr/local/bin/usb_scanner.sh
sudo chmod +x /usr/local/bin/usb_scanner.sh
sudo cp Linux/99-openrct2.rules /etc/udev/rules.d/99-openrct2.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

Important: launching graphical apps directly from udev is often unreliable. A desktop autostart watcher is usually better for daily use.

---

## ⚙️ Portable Configuration Reference

To keep the setup portable, use relative paths in your OpenRCT2 config where possible.

Example:

```ini
[general]
rct1_path = "data\\rct1"
game_path = "data\\rct2"
```

On Linux/macOS, paths may appear with `/` instead of `\\`.

---

## 🧪 Troubleshooting

### Windows: `py` is not recognized

Install Python from:

```text
https://www.python.org/downloads/
```

Then reopen Command Prompt and test:

```batch
py --version
```

If `py` still does not work, try:

```batch
python generate.py
```

or reinstall Python and make sure the Python Launcher is included.

---

### Windows: The launcher cannot find the USB

Check one of these:

1. Your USB label is:

```text
OpenRCT2_USB
```

or:

```text
OpenRCT2 USB
```

2. Your USB root contains:

```text
openrct2.exe
```

3. Check fallback log:

```text
%TEMP%\openrct2_usb_launcher_fallback.log
```

4. Check USB log:

```text
logs/latest.log
```

---

### Windows: OpenRCT2 launches but cannot find game files

Make sure your legal RCT2 files are in:

```text
data/rct2/
```

Optional RCT1 files can go in:

```text
data/rct1/
```

---

### Linux/macOS: Permission denied

Run:

```bash
chmod +x path/to/script.sh
```

For Linux AppImage:

```bash
chmod +x OpenRCT2.AppImage
```

---

## 📥 Downloads

Downloads can be done from:

- [GitHub Releases](https://github.com/surgamingoninsulin/OpenRCT2_Universal_Auto_UBS_Launchers/releases/tag/v1.0.0)
- or by copying/cloning the source code and running:

```batch
py generate.py
```

---

## 📄 License

This project is released under the **MIT License**.
