# Home Assistant Community Add-on: Mopidy

Hosts a [Mopidy Server](https://mopidy.com/) for music-playback, it includes a bunch of usefull extensions, Snapcast & Icecast.

## Installation

1. Click the button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Mopidy" add-on.
1. Check the logs of the "Mopidy" add-on to see it in action.

## Usage

- **In order to run the addon enable at least one audio-output.**

- All extensions are disabled by default in the configuration, with the exception of Mopidy-Stream & Mopidy-http. So make sure to enable those you want or need.

- To access extension-specific configurations click on `Show unused optional configuration options` at the bottom of the options-card.

- To control mopidy open the webinterface at `https://[HOSTNAME]:8066` or install [bushvin's Home Assistant Integration][ha-integration].

## Support

Ask a general question

[Report a bug or request a feature][issue].

## Authors & contributors

The original author of this repository is [Switch][author].

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=mopidy&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2Frepository

[author]: https://github.com/Switch123456789
[issue]: https://github.com/Switch123456789/mopidy/issues
[discussions]: https://github.com/Switch123456789/mopidy/discussions

[ha-integration]: https://github.com/bushvin/hass-integrations