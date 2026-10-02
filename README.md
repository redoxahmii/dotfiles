# dotfiles

- This contains my dotfiles for deploying Hyprland and my coding environment.
- Keep in mind that the Hyprland dotfiles are meant to be used alongside EndeavourOS KDE.

## Installation

- Use `install.sh` if you want to install only the coding environment.
- Use `hyprland.sh` if you want to install Hyprland.
  - These dotfiles are lean to make it compatible with EndeavourOS KDE.

## Desktop themes

Run `~/.config/hypr/scripts/switch-theme.sh solarized` once after setting up the symlinks, then use `solarized` or `tokyonight` to switch Rofi, Waybar, Kitty, Dunst, the desktop wallpaper and hypridle's next lock screen. New Neovim sessions use the selected colorscheme; existing ones can use `:colorscheme solarized-osaka` or `:colorscheme tokyonight`.

Press **Super+Shift+T** to choose a theme from Rofi. The preview follows the highlighted choice, using the idle desktop screenshots in `rofi/images/`.

The theme selection persists locally through symlinks and does not modify tracked theme files. Wallpaper paths in the switch script can be changed to your own images.

## Showcase
### Hyprland and Waybar
![image](https://github.com/user-attachments/assets/2bbd2dae-c560-40e9-a5fa-ced16ef01b01)

![image](https://github.com/user-attachments/assets/789ac34d-8ee5-4a0f-9471-46737cdd74c7)


### Rofi
![image](https://github.com/user-attachments/assets/388dd385-ff35-4885-b794-189daf6bb6fb)

![image](https://github.com/user-attachments/assets/1b516f54-fc02-4dfe-a4cf-b2d0437b9b80)

### Neovim and Kitty
![image](https://github.com/user-attachments/assets/ceb26e9c-65f1-45ce-ad2c-7559da8d05db)

![image](https://github.com/user-attachments/assets/2e51f1bc-66e7-4a53-a2ca-93601de0008c)

![image](https://github.com/user-attachments/assets/d922487b-bb25-4a83-9a74-4d3b020f4325)

### Tmux

![image](https://github.com/user-attachments/assets/c5cc9a29-8957-4544-87cf-bc72188907cb)


### Dunst
![image](https://github.com/user-attachments/assets/72a43bf8-dc64-4320-98c8-9f27ec51c9aa)


## Disclaimer
These are my personal dotfiles and they may or may not work on your end so keep that in mind.
