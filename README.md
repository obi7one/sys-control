# sys-control

A lightweight system control utility for Linux with Cinnamon desktop integration.

`sys-control` provides a simple command-line interface for common session and power-management actions, while also supporting graphical execution from desktop launchers.

## Features

- Shutdown the system
- Reboot the system
- Lock the current session
- Log out of the current session
- Suspend the system
- Turn off the display
- Activate the Cinnamon screensaver
- GUI notifications when launched outside a terminal
- Seven desktop launchers created by the installer
- Custom icons for each launcher

## Requirements

- Linux
- Cinnamon desktop environment
- Bash
- `systemctl`
- `cinnamon-screensaver-command`
- `cinnamon-session-quit`
- `loginctl`
- `xset`
- Zenity

## Installation

```bash
chmod +x install.sh
./install.sh
```

The installer creates the desktop application launchers in `~/.local/share/applications/`.

The launchers reference icons in `~/Pictures/icons/sys-control/`. Install them with:

```bash
mkdir -p ~/Pictures/icons/sys-control
cp -R icons/. ~/Pictures/icons/sys-control/
```

## Command-Line Usage

```bash
chmod +x sys-control.sh
./sys-control.sh --help
```

| Option | Description |
|---|---|
| `-s`, `--shutdown` | Shut down the system immediately |
| `-r`, `--reboot` | Reboot the system immediately |
| `-l`, `--lock` | Lock the current session |
| `-o`, `--logout` | Log out immediately |
| `-S`, `--sleep` | Suspend the system |
| `-d`, `--sleep-display` | Turn off the display |
| `-c`, `--screensaver` | Activate the screensaver |
| `-h`, `--help` | Show help |

Examples:

```bash
./sys-control.sh --lock
./sys-control.sh --sleep
./sys-control.sh --reboot
```

Multiple actions can be supplied:

```bash
./sys-control.sh --lock --screensaver
```

## Graphical Execution

When launched outside a terminal, the script switches to GUI mode and uses Zenity for informational and error messages. When launched from a terminal, normal command-line output is used.

## Desktop Launchers

The installer creates launchers for:

- Lock Screen
- Log Out
- Restart
- Shutdown
- Screensaver
- Sleep Display
- Sleep System

## Project Structure

```text
sys-control/
├── icons/
│   ├── lock.png
│   ├── log-out.png
│   ├── restart.png
│   ├── screensaver.png
│   ├── shutdown.png
│   ├── sleep-display.png
│   └── sleep-system.png
├── install.sh
├── sys-control.sh
├── .gitignore
├── LICENSE
└── README.md
```

## Uninstallation

Remove the generated launchers:

```bash
rm -f ~/.local/share/applications/{lock-screen,logout,restart,shutdown,screensaver,sleep-display,sleep-system}.desktop
```

Optionally remove the installed icons:

```bash
rm -rf ~/Pictures/icons/sys-control
```

## Notes

This project is intended for Cinnamon-based Linux desktops. Shutdown, reboot, logout and suspend actions take effect immediately.

The installer is intended to be executed on Linux, not macOS.

## License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE).

## Author

Gonzalo Suarez

## Repository

https://github.com/obi7one/sys-control
