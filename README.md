<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/OpenRCT2_logo.svg/960px-OpenRCT2_logo.svg.png?_=20230905044308" width="200" height="auto">

  # OpenRCT2 Cross-Platform Portable USB Launcher
  
</div>

Cross-platform portable launchers (VBS/Bash) for OpenRCT2 on Windows, macOS, and Linux. Features an event-driven silent trigger for Windows and plug-and-play paths for macOS/Linux to keep configurations, plugins, saves, and legal original game files 100% self-contained on your USB drive. under MIT License!

---

## 📁 Repository & USB Layout

To keep your portable installation fully operational across different operating systems, ensure your USB drive (ideally labeled `OpenRCT2_USB`) matches the structure seen in `image_6cf6c5.png` and `image_6cf6a8.png`:

```text
OpenRCT2_USB/
├── data/
│   ├── rct1/               <-- [CRITICAL] Your legal original RollerCoaster Tycoon 1 files
│   ├── rct2/               <-- [CRITICAL] Your legal original RollerCoaster Tycoon 2 files
│   ├── save/               <-- Portable save games directory
│   ├── plugin/             <-- Portable custom plugins
│   └── config.ini          <-- Local configuration profiles
├── openrct2.exe            <-- Windows Portable Executable
├── OpenRCT2.app/           <-- macOS Application Bundle (Extract here)
└── openrct2                <-- Linux Native Binary / AppImage extraction
```

> ⚠️ **IMPORTANT LEGAL NOTE:** The `data/rct1` and `data/rct2` directories contain the actual, legal, original game installations. These assets are required to run the open-source engine and are **not** shipped or redistributed with this software repository. You must supply your own retail files.

---

## 🪟 Windows Setup

As demonstrated in your core task configuration files (`image_6cf66a.png`), the Windows automation uses an Event-Triggered system file setup to run silently in the background without terminal flashes.

### Manual Launch
Run the standard batch file located on the root of your flash drive:
```batch
openrct2.exe --user-data-path=.\data
```

### Automatic Native Task Trigger
1. Place `usb_scanner.vbs` in your local computer configuration folder.
2. Open Windows **Task Scheduler** and link a custom trigger utilizing an XPath subscription event query targeting device insertion (`EventID=1006` via `Microsoft-Windows-Partition/Diagnostic`).
3. Point the task action directly to call the `.vbs` script file to locate and load the game silently.

---

## 🍏 macOS Setup

macOS does not use drive letters. It mounts drives predictably directly under the system path `/Volumes/OpenRCT2_USB`. 

### Installation
1. Move your native `OpenRCT2.app` directory into the root folder of your USB storage card.
2. Execute the included `launch_openrct2_mac.sh` shell script file. It maps path arguments directly into the engine executable hidden inside the app container:

```bash
#!/bin/bash
USB_PATH="/Volumes/OpenRCT2_USB"
cd "$USB_PATH"
./OpenRCT2.app/Contents/MacOS/OpenRCT2 --user-data-path="$USB_PATH/data" &
```

### Execution Permissions
Before running the script on a new Mac for the first time, unlock its operating security restrictions through the Terminal app:
```bash
chmod +x launch_openrct2_mac.sh
```

---

## 🐧 Linux Setup

Linux variants dynamically map mass storage device handles beneath the user instance environment path `/media/your_username/OpenRCT2_USB`.

### Installation
1. Place your target `openrct2` application executable or standalone binary on the root of the volume.
2. Run `launch_openrct2_linux.sh`. The script queries your host shell identity environment variable to calculate the absolute volume location automatically:

```bash
#!/bin/bash
USER_NAME=$(whoami)
USB_PATH="/media/$USER_NAME/OpenRCT2_USB"
cd "$USB_PATH"
chmod +x "./openrct2"
./openrct2 --user-data-path="$USB_PATH/data" &
```

### Execution Permissions
To allow the script binary file to run on your distribution, open a terminal path tool window and input:
```bash
chmod +x launch_openrct2_linux.sh
```

---

## ⚙️ Portable Configurations Reference

As detailed in `image_6cf66a.png`, your portable initialization files will auto-generate configurations mapped to internal folders rather than computer registries. Ensure your `data/config.ini` contains the following local path strings to maintain strict portability:

```ini
[general]
rct1_path = "data\\rct1"
game_path = "data\\rct2"
```

## Downloads
Downloading can be done at 
- [Releases](https://github.com/surgamingoninsulin/OpenRCT2_Universal_Auto_UBS_Launchers/releases/tag/v1.0.0)
- or copy the source code!
