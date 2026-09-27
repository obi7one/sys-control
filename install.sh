#!/bin/bash

APPDIR="$HOME/.local/share/applications"
ICONS="$HOME/Pictures/icons/sys-control"

mkdir -p "$APPDIR"

# Lock
cat > "$APPDIR/lock-screen.desktop" <<EOF
[Desktop Entry]
Name=Lock Screen
Comment=Lock the current session
Exec=loginctl lock-session
Icon=$ICONS/lock.png
Terminal=false
Type=Application
Categories=System;
EOF

# Logout
cat > "$APPDIR/logout.desktop" <<EOF
[Desktop Entry]
Name=Log Out
Comment=End current session
Exec=cinnamon-session-quit --logout
Icon=$ICONS/log-out.png
Terminal=false
Type=Application
Categories=System;
EOF

# Restart
cat > "$APPDIR/restart.desktop" <<EOF
[Desktop Entry]
Name=Restart
Comment=Restart the computer
Exec=systemctl reboot
Icon=$ICONS/restart.png
Terminal=false
Type=Application
Categories=System;
EOF

# Shutdown
cat > "$APPDIR/shutdown.desktop" <<EOF
[Desktop Entry]
Name=Shutdown
Comment=Power off the computer
Exec=systemctl poweroff
Icon=$ICONS/shutdown.png
Terminal=false
Type=Application
Categories=System;
EOF

# Screensaver
cat > "$APPDIR/screensaver.desktop" <<EOF
[Desktop Entry]
Name=Screensaver
Comment=Start the screensaver
Exec=cinnamon-screensaver-command --activate
Icon=$ICONS/screensaver.png
Terminal=false
Type=Application
Categories=System;
EOF

# Sleep Display
cat > "$APPDIR/sleep-display.desktop" <<EOF
[Desktop Entry]
Name=Sleep Display
Comment=Turn off monitor
Exec=xset dpms force off
Icon=$ICONS/sleep-display.png
Terminal=false
Type=Application
Categories=System;
EOF

# Sleep System
cat > "$APPDIR/sleep-system.desktop" <<EOF
[Desktop Entry]
Name=Sleep System
Comment=Suspend the system
Exec=systemctl suspend
Icon=$ICONS/sleep-system.png
Terminal=false
Type=Application
Categories=System;
EOF

chmod +x "$APPDIR"/*.desktop

echo "Launchers created in $APPDIR"
