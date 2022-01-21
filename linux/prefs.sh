 #!/bin/bash

echo "##### Loading System Preferences #####"

# user preferences
gsettings set org.gnome.desktop.background picture-uri file://$HOME/.local/share/backgrounds/fluttershy_bg.jpg
sudo convert $HOME/Pictures/avatar.jpg -resize 200x200 /var/lib/AccountsService/icons/$USER

gsettings set org.gnome.desktop.session idle-delay 60 # set autolock

# set theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.wm.preferences theme 'Adwaita'


# touchpad & mouse settings
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.0
gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-finger-scrolling'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad middle-click-emulation false
gsettings set org.gnome.desktop.peripherals.touchpad left-handed 'mouse'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

