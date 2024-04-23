# Home Assistant Community Add-on: Mopidy+

### Features
- Enables music-playback through [Mopidy](https://mopidy.com/)
- Includes many useful extensions, Snapcast & Icecast
- All important settings are available on add-on configuration-page.

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

1. [![SHOW ADD-ON ON MY HOME ASSISTANT](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_mopidy&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons)
2. Click OK on the pop-up to add my repo to Home Assistant
3. Click install

### Configuration

- **Enable at least one audio-output** on the add-on configuration-page.

- **Enable the extensions you want to use**. Only Mopidy-Stream & Mopidy-http are on by default and those can't be disabled.

- **Access extension-specific configurations** by clicking on`Show unused optional configuration options`.

- **Control mopidy** by installing [bushvin's Home Assistant Integration] and/or enabling an interface-extension and navigate to `http://[HOSTNAME]:8066`. 

- **Use [Snapcast]** through [iris]' Snapcast-implementation or navigate to `http://[HOSTNAME]:1780`. On Android use the [Snapcast-app] and enter your hostname in the settings.

- **Use [Icecast]** by navigating to `http://[HOSTNAME]:8000/mopidy` with a webbrowser or a media-player like [vlc](https://github.com/videolan/vlc).

### More infos

- [Repo add-on-page](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons)

[bushvin's Home Assistant Integration]: https://github.com/bushvin/hass-integrations
[iris]: https://github.com/jaedb/Iris
[Snapcast]: https://github.com/badaix/snapcast
[Snapcast-app]: https://play.google.com/store/apps/details?id=de.badaix.snapcast
[Icecast]: https://icecast.org/