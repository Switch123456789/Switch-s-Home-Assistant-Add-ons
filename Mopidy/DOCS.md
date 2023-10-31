# Home Assistant Community Add-on: Mopidy+

Hosts a [Mopidy Server](https://mopidy.com/) for music-playback, it includes a bunch of usefull extensions, Snapcast & Icecast.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

**Features:**
- Output types: Local audio-adapter, snapcast & Icecast.
- Source types: Local music & playlists, mediastreams, YouTube, Soundcloud & Mixcloud
- Web-interfaces: Iris & Yap
- Configure mopidys extensions within Home Assistant

**Restrictions:**
- Ingress doesn't work

## Installation

- Click the button below to open the add-on in your Home Assistant instance.

  [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

## Usage

- **In order to run the addon enable at least one audio-output.**

- All extensions are disabled by default in the configuration, with the exception of Mopidy-Stream & Mopidy-http. So make sure to enable those you want or need.

- To access extension-specific configurations click on `Show unused optional configuration options` at the bottom of the options-card.

- To control mopidy open the webinterface at `http://[HOSTNAME]:8066` or install [bushvin's Home Assistant Integration][ha-integration].

## Support

- [Discuss the addon here][discussions]

- [Report a bug or request a feature here][issue]

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_mopidy&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons
[issue]: https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/issues
[discussions]: https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/discussions
[ha-integration]: https://github.com/bushvin/hass-integrations

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg