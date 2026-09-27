#!/bin/bash

# Cinnamon system control script (silent execution for GUI)

show_help() {
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  -s, --shutdown         Shutdown the system immediately"
    echo "  -r, --reboot           Reboot the system immediately"
    echo "  -l, --lock             Lock the screen"
    echo "  -o, --logout           Log out immediately"
    echo "  -S, --sleep            Suspend the system"
    echo "  -d, --sleep-display    Turn off display"
    echo "  -c, --screensaver      Start screensaver"
    echo "  -h, --help             Show this help"
}

show_gui_message() {
    zenity --info --title="Cinnamon Control" --text="$1"
}

# Detect if run from terminal
if [ -t 1 ]; then
    GUI=false
else
    GUI=true
fi

if [ $# -eq 0 ]; then
    if [ "$GUI" = true ]; then
        show_gui_message "No option provided.\nUse --help in terminal for usage."
    else
        show_help
    fi
    exit 0
fi

for arg in "$@"; do
    case $arg in
        -s|--shutdown)
            CMD="systemctl --no-wall poweroff"
            ;;
        -r|--reboot)
            CMD="systemctl --no-wall reboot"
            ;;
        -l|--lock)
            CMD="cinnamon-screensaver-command -l"
            ;;
        -o|--logout)
            CMD="cinnamon-session-quit --logout --no-prompt"
            ;;
        -S|--sleep)
            CMD="systemctl suspend"
            ;;
        -d|--sleep-display)
            CMD="xset dpms force off"
            ;;
        -c|--screensaver)
            CMD="cinnamon-screensaver-command -a"
            ;;
        -h|--help)
            if [ "$GUI" = true ]; then
                show_gui_message "Options:\n-s --shutdown\n-r --reboot\n-l --lock\n-o --logout\n-S --sleep\n-d --sleep-display\n-c --screensaver\n-h --help"
            else
                show_help
            fi
            exit 0
            ;;
        *)
            if [ "$GUI" = true ]; then
                show_gui_message "Unknown option: $arg"
            else
                echo "Unknown option: $arg"
                show_help
            fi
            exit 1
            ;;
    esac

    # Execute the command silently if GUI, otherwise normally
    if [ "$GUI" = true ]; then
        eval "$CMD" &
    else
        eval "$CMD"
    fi
done