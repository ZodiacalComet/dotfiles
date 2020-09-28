<p align="center">
    <img src="https://i.imgur.com/pxd4KiX.png">
</p>

---

- **WM:** bspwm
- **Bar:** polybar
- **Compositor:** picom
- **Terminal Emulator:** [st (Luke Smith's fork)](https://github.com/LukeSmithxyz/st)
- **Shell:** zsh
- **Editor:** vim
- **Application Launcher:** dmenu (patched)
- **Notification Daemon:** dunst
- **Hotkey Daemon:** sxhkd
- **Browser:** qutebrowser & chromium
- **Sound server:** pulseadio
- **Music Player:** mpd, mpc, ncmpcpp
- **Video Player:** mpv & vlc
- **Image Viewer:** sxiv
- **File Explorer:** ranger & thunar
- **RSS Feed Reader:** newsboat
- **Screenshots:** flameshot

---

```bash
git clone --bare https://github.com/ZodiacalComet/dotfiles.git $HOME/.dotfiles

alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

dot checkout
dot config status.showUntrackedFiles no
```
