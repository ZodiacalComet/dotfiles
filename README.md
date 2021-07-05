<p align="center">
    <img src="https://i.imgur.com/pxd4KiX.png">
</p>

---

```bash
git clone --bare https://github.com/ZodiacalComet/dotfiles.git $HOME/.dotfiles

alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

dot checkout
dot config status.showUntrackedFiles no
```

---

- **WM:** bspwm
- **Bar:** polybar
- **Compositor:** picom
- **Terminal Emulator:** [Luke Smith's st build](https://github.com/LukeSmithxyz/st)
- **Terminal Font**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) & [FontAwesome](https://fontawesome.com/download)
- **Shell:** zsh
- **Editor:** vim
- **Application Launcher:** dmenu (patched)
- **Notification Daemon:** dunst
- **Hotkey Daemon:** sxhkd
- **Browser:** qutebrowser & firefox
- **Sound server:** pulseadio
- **Music Player:** mpd, mpc, ncmpcpp
- **Video Player:** mpv & vlc
- **Image Viewer:** sxiv
- **File Explorer:** ranger & thunar
- **RSS Feed Reader:** newsboat
- **Screenshots:** flameshot

# Themes

- **GTK:** [Material Black Blueberry 4.0](https://www.opendesktop.org/s/Gnome/p/1316887/) & [Flatery Pink](https://www.gnome-look.org/s/Gnome/p/1332404)
- **Firefox:** [Material Ocean](https://addons.mozilla.org/en-US/firefox/addon/material-ocean/)

# Firefox Add-ons

- [**uBlock Origin**](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/): Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.

- [**Privacy Badger**](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/): Automatically learns to block invisible trackers.

- [**Decentraleyes**](https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/): Protects you against tracking through "free", centralized, content delivery.

- [**HTTPS Everywhere**](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/): Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.

- [**ClearURLs**](https://addons.mozilla.org/en-US/firefox/addon/clearurls/): Removes tracking elements from URLs.

- [**Universal Bypass**](https://addons.mozilla.org/en-US/firefox/addon/universal-bypass/): Don't waste your time with compliance. Universal Bypass automatically skips annoying link shorteners.

- [**Buster: Captcha Solver for Humans**](https://addons.mozilla.org/en-US/firefox/addon/buster-captcha-solver/): Save time by asking Buster to solve captchas for you.

- [**Translate Web Pages**](https://addons.mozilla.org/en-US/firefox/addon/traduzir-paginas-web/): Translate your page in real time using Google or Yandex.

- [**KeePassXC-Browser**](https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/): Official browser plugin for the KeePassXC password manager (https://keepassxc.org).

- [**Violentmonkey**](https://addons.mozilla.org/en-US/firefox/addon/violentmonkey/): Violentmonkey provides userscripts support for browsers. It's open source! https://github.com/violentmonkey/violentmonkey

# Manually installed applications

## Pre-compiled binaries

- [**Go**](https://golang.org/): Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.

  See [binaries](https://golang.org/dl/) and [install instructions](https://golang.org/doc/install).

- [**MEGASync**](https://mega.io/sync): Easy automated synchronisation between your computer and your MEGA cloud.

- [**rustup**](https://github.com/rust-lang/rustup): The Rust toolchain installer.

  ```sh
  $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- [**Thunderbird**](https://www.thunderbird.net/en-US/): Thunderbird is a free email application that’s easy to set up and customize - and it’s loaded with great features!.

  See [binaries](https://www.thunderbird.net/en-US/thunderbird/all/).

## Snap

- [**KeepassXC**](https://snapcraft.io/keepassxc): Modern, secure, and cross-platform password manager compatible with KeePass.

  Since it has the latest unlike the Debian repositories.

- [**Node**](https://snapcraft.io/node): A JavaScript runtime built on Chrome's V8 JavaScript engine.

  They have the most recent versions compiled for the i386 architecture.

## Built

- [**picom**](https://github.com/yshui/picom): A lightweight compositor for X11.

  ```sh
  $ git submodule update --init --recursive
  $ meson --buildtype=release . build
  $ ninja -C build
  $ ninja -C build install
  ```

- [**fzf**](https://github.com/junegunn/fzf): 🌸 A command-line fuzzy finder.

  ```sh
  $ make install
  ```

- [**ImageMagick**](https://github.com/ImageMagick/ImageMagick): 🧙‍♂️ ImageMagick 7.

  ```sh
  $ wget https://www.imagemagick.org/download/ImageMagick.tar.gz
  $ tar xvzf ImageMagick.tar.gz
  $ cd ImageMagick-7.0.8-26/

  $ ./configure
  $ make
  $ sudo make install
  $ sudo ldconfig /usr/local/lib
  $ magick -version
  ```

- [**Polybar**](https://github.com/polybar/polybar): A fast and easy-to-use status bar.

  See [building](https://github.com/polybar/polybar/wiki/Compiling#building).

- [**Python 3.9.5**](https://www.python.org/downloads/release/python-395/): __a__.

  ```sh
  $ wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
  $ tar -xf Python-3.9.5.tgz
  $ cd Python-3.9.5

  $ ./configure --enable-optimizations
  $ make -j 2
  $ sudo make altinstall
  $ python3.9 --version
  ```

- [**youtube-viewer**](https://github.com/trizen/youtube-viewer): Lightweight YouTube client for Linux.

  ```sh
  # First install this
  $ cpan Module::Build

  # Then, as instructed in the README
  $ perl Build.PL
  $ sudo ./Build installdeps
  $ sudo ./Build install
  ```

## Pip

- [**pipx**](https://github.com/pipxproject/pipx): Install and Run Python Applications in Isolated Environments.

### Pipx

- [**black**](https://github.com/psf/black): The uncompromising Python code formatter.
- [**fanficfare**](https://github.com/JimmXinu/FanFicFare): FanFicFare is a tool for making eBooks from stories on fanfiction and other web sites.
- [**fimfic-tracker**](https://github.com/ZodiacalComet/fimfic-tracker): An unnecessary CLI application for tracking stories on Fimfiction.
- [**fimfic2epub-cover-patch**](https://github.com/ZodiacalComet/fimfic2epub-cover-patch): Wrapper script around fimfic2epub's CLI to handle stories without a cover.
- [**flake8**](https://github.com/PyCQA/flake8): flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins to check the style and quality of some python code.
  - [**flake8-bugbear**](https://github.com/PyCQA/flake8-bugbear): A plugin for Flake8 finding likely bugs and design problems in your program. Contains warnings that don't belong in pyflakes and pycodestyle.
- [**grip**](https://github.com/joeyespo/grip): Preview GitHub README.md files locally before committing them.
- [**isort**](https://github.com/PyCQA/isort): A Python utility / library to sort imports.
- [**pre-commit**](https://github.com/pre-commit/pre-commit): A framework for managing and maintaining multi-language pre-commit hooks.
- [**tuir**](https://gitlab.com/ajak/tuir): Browse Reddit from your terminal.
- [**youtube-dl**](https://github.com/ytdl-org/youtube-dl): Command-line program to download videos from YouTube.com and other video sites.

## Cargo

- [**bat**](https://github.com/sharkdp/bat): A cat(1) clone with wings.
- [**fd**](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'.
- [**rls**](https://github.com/rust-lang/rls): The RLS provides a server that runs in the background, providing IDEs, editors, and other tools with information about Rust programs.

## Npm

- [**fimfic2epub**](https://github.com/daniel-j/fimfic2epub): 📚 Chrome/Firefox extension & npm package for improved EPUB export on fimfiction.net

  The version 1.7.55, the most recent as of now, the "--dir" flag doesn't really work for me. So I install the version that I had previously.
  ```
  $ npm i -g fimfic2epub@1.7.52
  ```

# Post-installation

## MPD

```sh
$ sudo systemctl stop mpd.socket
$ sudo systemctl stop mpd.service

$ sudo systemctl disable mpd.socket
$ sudo systemctl disable mpd.service

$ mkdir ~/.cache/mpd
$ mkdir -p ~/.local/share/mpd/playlists
```

## VIM

- [**vim-plug**](https://github.com/junegunn/vim-plug): 🌺 Minimalist Vim Plugin Manager.

  ```sh
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

### Spellchecking

```
Warning: Cannot find word list "es.utf-8.spl" or "es.ascii.spl"
```

To get the necessary files, just untoggle and then toggle spell checking to get a download prompt.
