## my dotfiles

These represent a combination of things I've written and configured, as well as snippets, tips, and tricks scavenged from the internet. They have been cobbled together over the course of several years; there's undoubtedly going to be some garbage and less-than-ideal things buried within. Peruse and use at your own peril.

## what's here

At present this repo contains:
```
     __  _  _
    / _|(_)| |  ___  ___
   | |_ | || | / _ \/ __|
 _ |  _|| || ||  __/\__ \
(_)|_|  |_||_| \___||___/

bash            || bash settings, colors, aliases, functions, etc.
bitlbee         || bitlbee irc <-> xmpp relay configurations [encrypted]
bspwm           || bspwm config, plus panel and bar scripts
compton         || minimal composting for true transparency
conky           || conkyrc for desktop system monitoring
dunst           || simple, non-intrusive, dbus notification daemon
fontconfig      || fontconfig for powerline symbols
fonts           || fonts for panel, bar, and powerline
nitrogen        || wallpaper manager
ranger          || basic file manager config with image preview
sxhkd           || keyboard bindings, mostly for bspwm
tmux            || my long-standing multiplexer config
vim             || vim settings, colors, and plugins (it's a mess)
weechat         || weechat configs for IRC [encrypted]
weechat-xmpp    || secondary weechat config for second instance with bitlbee [encrypted]
x               || X font, color, and terminal options. xinit script for bspwm
```

## repo layout

The top level layout here consists of the following directories:

* assets/
  * This is where (mostly) binary files, such as wallpapers, live.
* bin/
  * Scaffolding for deploying dotfiles
* configs/
  * The actual dotfiles, organized into directories for each application / configuration. Within each directory the hierarchy should mirror the intended structure from `$HOME/` (with exceptions, see: bitlbee)

## installation

Installing / bootstrapping the dotfiles into a new, or existing, system is accomplished via `bin/install.sh`. The install script leverages [gnu stow](http://www.gnu.org/software/stow/) for the heavy lifting.

***
***#NOTES:*** 

In its current state, my weechat configs are completely encrypted. I'll be looking to change this so only the .confs with potentially sensitive info are encrypted, freeing the rest up for viewing / borrowing / whatever.

The bitlbee configs aren't strictly dotfiles, and need to be installed into `/etc/bitlbee` and `/var/lib/bitlbee`. It's also important that these files have the correct owner and permissions, otherwise bitlbee won't work.

***
***#TODO:*** 

* Complete the cleanup of existing dotfiles and configs.
* Complete install script, with provisioning for encryption and atypical configruations (see note on bitlbee above).
* Cleanup and polish `.gitignore`
