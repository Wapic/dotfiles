#!/usr/bin/env bash

# Setup yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay

# Setup chaotic-aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

# Setup SDDM
yay -S sddm qt6-5compat qt6-declarative qt6-svg
sudo git clone https://github.com/kamack38/sddm-greenleaf-theme.git /usr/share/sddm/themes/greenleaf
sudo rm /usr/share/sddm/themes/greenleaf/background.png
sudo mv /home/wapic/dotfiles/.config/hypr/wallpaper.png /usr/share/sddm/themes/greenleaf/background.png
sudo sed -i 's/Font=\"JetBrainsMono Nerd Font Mono\"/FiraCode Nerd Font Mono/' /usr/share/sddm/themes/greenleaf/theme.conf
echo -e "[Theme]\nCurrent=greenleaf" | sudo tee /etc/sddm.conf

yay -Syu jdk11-openjdk jdk21-openjdk jdk8-openjdk libqalculate openssh wl-clipboard slurp grim \
       hyprland hyprpaper hyprpicker hypridle xdg-desktop-portal-hyprland xdg-desktop-portal-gtk lxqt-policykit uwsm dunst wofi rofi-wayland ags-hyprpanel-git gnome-keyring clipboard-sync \
       pipewire pipewire-jack pipewire-pulse pipewire-alsa wireplumber pavucontrol audacity playerctl \
       kitty foot fzf bat zsh zip unzip tmux brightnessctl yt-dlp btop fastfetch \
       firefox chromium thunderbird nautilus nextcloud-client imv seahorse nwg-look mpv intellij-idea-community-edition chromium pinta stremio nodejs discord \
       icedtea-web filezilla virt-viewer \
       mangohud vulkan-tools corectrl steam prismlauncher gamescope \
       gnome-theme-extras gtk-engine-murrine breeze-icons noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd ttf-hack-nerd qt5-wayland qt6-wayland \
       udiskie nautilus-open-any-terminal --needed

# Enable systemd units
systemctl enable --user --now gcr-ssh-agent.socket # Gnome-keyring ssh-agent
systemctl enable --user --now clipboard-sync # Syncing clipboards between Wayland and XWayland
sudo systemctl enable sddm # Display manager

# Set keyboard layout
sudo localectl set-x11-keymap "se" "pc105" "" "caps:escape_shifted_capslock"

# Setup nautilus
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal foot

# Setup GTK theme
git clone https://github.com/vinceliuice/Lavanda-gtk-theme.git ~/Lavanda-gtk-theme
cd ~/Lavanda-gtk-theme
/bin/bash install.sh
rm -rf ~/Lavanda-gtk-theme

# Setup Neovim
sudo pacman -S neovim npm nodejs python3 pyright lua-language-server
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo npm install -g typescript-language-server bash-language-server typescript neovim

echo 'Installation complete! reboot and your system will be done!'
