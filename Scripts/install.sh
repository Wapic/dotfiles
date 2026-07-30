#!/usr/bin/env bash

# Setup yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay

# Download Packages
yay -Syu jdk-temurin libqalculate openssh wl-clipboard slurp grim \
       hyprland hyprpaper hyprpicker hypridle xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent uwsm dunst rofi-wayland waybar gnome-keyring \
       pipewire pipewire-jack pipewire-pulse pipewire-alsa wireplumber pavucontrol playerctl \
       foot fzf zsh zip unzip tmux brightnessctl yt-dlp btop fastfetch \
       librewolf-bin chromium thunderbird nautilus nextcloud-client imv seahorse nwg-look mpv nodejs discord \
       icedtea-web virt-viewer \
       mangohud vulkan-tools steam prismlauncher gamescope gamemode \
       gnome-theme-extras gtk-engine-murrine breeze-icons noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd ttf-hack-nerd qt5-wayland qt6-wayland \
       udiskie --needed

# Setup SDDM
yay -Syu sddm qt6-5compat qt6-declarative qt6-svg

# Theme SDDM
sudo git clone https://github.com/kamack38/sddm-greenleaf-theme.git /usr/share/sddm/themes/greenleaf
echo -e "[Theme]\nCurrent=greenleaf" | sudo tee /etc/sddm.conf

# Enable systemd units
systemctl enable --user gcr-ssh-agent.socket # Gnome-keyring ssh-agent
systemctl enable --user clipboard-sync # Syncing clipboards between Wayland and XWayland
systemctl enable --user hyprpaper.service # Wallpaper service
systemctl enable --user hypridle.service # Black out screen after timeout
systemctl enable --user hyprpolkitagent.service # GUI Authentication agent
systemctl enable --user waybar.service # Taskbar
sudo systemctl enable sddm # Display manager

# Set keyboard layout
sudo localectl set-x11-keymap "se" "pc105" "" "caps:escape_shifted_capslock"

# Setup GTK theme
git clone https://github.com/vinceliuice/Lavanda-gtk-theme.git ~/Lavanda-gtk-theme
cd ~/Lavanda-gtk-theme
/bin/bash install.sh
rm -rf ~/Lavanda-gtk-theme

# Setup Neovim
yay -Syu neovim npm nodejs python3 pyright lua-language-server
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo npm install -g typescript-language-server bash-language-server typescript neovim

echo 'Installation complete! reboot and your system will be done!'

