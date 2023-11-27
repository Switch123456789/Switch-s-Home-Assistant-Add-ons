# Home Assistant Community Add-on: Mopidy+

Enables music-playback through [Mopidy](https://mopidy.com/), it includes a bunch of useful extensions, Snapcast & Icecast. Extensions can be configured in the add-on configuration.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

**Playback-options:**
- [Local audio-device](https://github.com/home-assistant/plugin-audio)
- [fifo](https://man7.org/linux/man-pages/man7/fifo.7.html)
- [Snapcast](https://github.com/badaix/snapcast)
- [Icecast](https://github.com/xiph/Icecast-Server)

**Backend-extensions:**
- [Mopidy](https://github.com/mopidy/mopidy) (Files, Playlists & Streams)
- [Mopidy-Local](https://github.com/mopidy/mopidy-local)
- [Mopidy-Mixcloud](https://github.com/unusualcomputers/unusualcomputers/tree/master/code/mopidy/mopidymixcloud)
- [Mopidy-Soundcloud](https://github.com/mopidy/mopidy-soundcloud)
- [Mopidy-Youtube](https://github.com/natumbri/mopidy-youtube)

**Interface-extensions:**
- [Mopidy-Iris](https://github.com/jaedb/iris)
- [Mopidy-Mobile](https://github.com/tkem/mopidy-mobile)
- [Mopidy-Yap](https://github.com/dyj216/mopidy-yap)

## Installation

- Click the button below to open the add-on in your Home Assistant instance.

  [![badge]](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_mopidy&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons)

## Usage

- **Enable at least one audio-output** in the add-ons configuration-page.

- **All extensions are disabled by default**, with the exception of Mopidy-Stream & Mopidy-http. Make sure to enable those you wish to use.

- To access **extension-specific configurations** click on `Show unused optional configuration options` in the add-on-configuration.

- To **control mopidy** enable an interface and open `http://[HOSTNAME]:8066` and/or install [bushvin's Home Assistant Integration].

- **[Snapcast]** can be used through [iris]' Snapcast-implementation or at `http://[HOSTNAME]:1780`.  On Android install the [Snapcast-app] and enter your hostname in the settings.

- **[Icecast]** can be accessed through `http://[HOSTNAME]:8000/mopidy`.

## Support

- **[Discuss the add-on here](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/discussions)**

- **[Report a bug or request a feature here](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/issues)**

[bushvin's Home Assistant Integration]: https://github.com/bushvin/hass-integrations
[iris]: https://github.com/jaedb/Iris
[Snapcast]: https://github.com/badaix/snapcast
[Snapcast-app]: https://play.google.com/store/apps/details?id=de.badaix.snapcast
[Icecast]: https://icecast.org/

[badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg