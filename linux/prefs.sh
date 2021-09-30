 #!/bin/bash

echo "##### Loading System Preferences #####"

# user preferences
gsettings set org.gnome.desktop.background picture-uri file://$HOME/.local/share/backgrounds/fluttershy_bg.jpg
sudo convert $HOME/Pictures/avatar.jpg -resize 200x200 /var/lib/AccountsService/icons/$USER

# guake settings
gsettings set guake.general start-at-login true
gsettings set guake.general use-trayicon false
gsettings set guake.general window-losefocus true
gsettings set guake.general window-ontop true
gsettings set guake.general window-tabbar false
gsettings set guake.general use-default-font false
gsettings set guake.style.font palette-name 'Tomorrow Night Eighties'
gsettings set guake.style.font bold-is-bright true
gsettings set guake.style.font allow-bold true
gsettings set guake.style.font style 'MesloLGS NF 10'
gsettings set guake.style.background transparency 90
gsettings set get guake.keybindings.global show-hide 'Favorites'
