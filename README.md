# growl-battery-warning

## Purpose: Use Growl to get a warning when your battery reaches a certain percentage (or lower)

1. Install [Growl](https://apps.apple.com/us/app/growl/id467939042?mt=12) and [growlnotify](http://growl.cachefly.net/GrowlNotify-2.1.zip)

2. Save the shell script to `/usr/local/bin/growl-battery-warning.sh`

3. Make it executable `chmod 755 /usr/local/bin/growl-battery-warning.sh`

4. Save the plist as `"$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"` where `$HOME` stands for your home directory.

5. Enable it by running this command:

		launchctl load "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"

## Need to stop it for awhile?

		launchctl unload "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"

This will stop it until you run the `launchctl load` command again, or logout/login, or reboot/login.

## Want to stop it forever?

		launchctl unload "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"

		mv "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist" "$HOME/.Trash/"


## "I want to change the threshold for when I get warned!"


Edit `/usr/local/bin/growl-battery-warning.sh` in a text editor and change this line:

		WARNING_THRESHOLD='40'

to something else.

This would make it 30%:

		WARNING_THRESHOLD='30'

Note that you do ***not*** want to put the `%` sign in there, just a whole number between 1-100.

## "I want to change how often it runs!"

1. Unload the .plist

		launchctl unload "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"

2. Edit the .plist in a text editor or [LaunchControl](https://www.soma-zone.com/LaunchControl/). The '60' below means 'once every 60 seconds'. Feel free to adjust to your liking. Save the .plist once you have edited the file.

		<key>StartInterval</key>
		<integer>60</integer>



3. Reload the plist:

		launchctl load "$HOME/Library/LaunchAgents/com.tjluoma.growl-battery-warning.plist"

