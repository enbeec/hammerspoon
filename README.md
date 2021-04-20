# Kelly's Hammerspoon Config

## Installation

- Install Hammerspoon: `brew install --cask hammerspoon`
- Clone this repo into your local Hammerspoon configuration location: `git clone [repo] ~/.hammerspoon`
    - *in a lot of cases you might stop here but we still need to include the Zoom plugin (aka 'Spoon') code in such a way that it can be updated easily*
- The Zoom code is referenced within this repo, but it isn't downloaded by default. You can add it by running: `git submodule update --init` and that's it! Start Hammerspoon and test out your shortcuts!
- In the future, you may be asked to `submodule update` again but don't do it on your own. You want to keep your version of the Zoom plugin **stable**. If there's an update to the plugin, I'll pull it and make sure it works with your config first.

**Beware** -- the reason I wasn't able to just write up a slick little config for us all to share is because there are bugs in the Zoom plugin. Thankfully, toggling the mute works just fine! However, if you do notice it failing, click on the Hammerspoon logo in your Menu Bar and select "Console....". Copy everything in there and shoot it to me so I can debug any problems! 

## Usage

First, make sure Hammerspoon is running *before* Zoom. Since you aren't actively editing your config, you won't need to worry about finding a time to reboot your Zoom so that you can try a new config.

⌥Z (`opt-Z`) -- Toggle Zoom Mute

## Todo
- [ ] add an indicator to the menubar: :apple: for muted, :green_apple: for unmuted
    - to start, this will just always be there while Hammerspoon is running. This keeps debugging to a minimum, since trying to respond to Zoom's state changes is **super buggy**.
- [ ] make the indicator hideable with another shortcut -- maybe ⌥V or ⌥⇧Z?
- [ ] have the indicator spawned when meetings begin and disabled when meetings end **without breaking and disappearing or getting stuck all the time**.
    - sadly, a lot of the neat behavior I had planned depends on being able to check on the status of the Zoom meeting... this item is __stalled__ until someone with the time and understanding fixes the plugin.
