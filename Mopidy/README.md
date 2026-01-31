# [DEPRICATED] Home Assistant Community Add-on: Mopidy+
![](logo.png)
### Features
- Enables music-playback through [Mopidy](https://mopidy.com/)
- Includes many useful extensions, Snapcast & Icecast
- All important settings are available on the add-on configuration-page.

### Playback-options
- [Local audio-device](https://github.com/home-assistant/plugin-audio)
- [fifo](https://man7.org/linux/man-pages/man7/fifo.7.html)
- [Snapcast](https://github.com/badaix/snapcast)
- [Icecast](https://github.com/xiph/Icecast-Server)

### Backend-extensions
- [Mopidy](https://github.com/mopidy/mopidy) (Files, Playlists & Streams)
- [Mopidy-Local](https://github.com/mopidy/mopidy-local)
- [Mopidy-Mixcloud](https://github.com/unusualcomputers/unusualcomputers/tree/master/code/mopidy/mopidymixcloud)
- [Mopidy-Soundcloud](https://github.com/mopidy/mopidy-soundcloud)
- [Mopidy-Youtube](https://github.com/natumbri/mopidy-youtube)

### Interface-extensions
- [Mopidy-Iris](https://github.com/jaedb/iris)
- [Mopidy-Mobile](https://github.com/tkem/mopidy-mobile)
- [Mopidy-Yap](https://github.com/dyj216/mopidy-yap)

# Help
### Installation

1. Click: [![SHOW ADD-ON ON MY HOME ASSISTANT](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_mopidy&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons)
2. Click OK on the pop-up to add my repo to Home Assistant
3. Click install

### Configuration

- **Enable at least one output-method and all extensions you wish to use!**  
Only Mopidy-Stream & Mopidy-http are enabled by default and those can't be disabled.

- **Navigate to the addon-settings to enable/disable extensions & output-methods.**  
Click on `Show unused optional configuration options` to show extension-specific settings that are set to default.

- **Install [bushvin's Home Assistant Integration](https://github.com/bushvin/hass-integrations) if you want to control mopidy with Home Assistant**  
You can install the integration using [HACS](https://hacs.xyz/), more instructions can be found on [the integration's github-page](https://github.com/bushvin/hass-integrations).

- **Navigate to `http://[HOSTNAME]:6680` to use [Mopidy](https://github.com/mopidy/mopidy)**  
Make sure your prefered webinterface-extensions are enabled. You can enable one or multiple at the same time.

- **Navigate to `http://[HOSTNAME]:1780` to use [Snapcast](https://github.com/badaix/snapcast)**  
You can also use [iris' webinterface](https://github.com/jaedb/Iris) to playback snapcast streams. On Android install the [Snapcast-app](https://play.google.com/store/apps/details?id=de.badaix.snapcast) and enter your hostname in the settings.

- **Navigate to `http://[HOSTNAME]:8000/mopidy` to use [Icecast](https://icecast.org)**  
Some Browser's media-player can be janky with live-streaming, so I suggest to open the URL in [vlc](https://github.com/videolan/vlc) or whatever software you prefer.

### More infos

- [Repo add-on-page](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons)