# Home Assistant Community Add-on: CUPS

Hosts a CUPS Server to enable printer sharing to the local network.

**Features:**
- Printer Announcement on the local network using zeroconf/avahi
- Customizable cupsd.conf through CUPS-webinterface
- Option to reset cupsd.conf to regain access without a full reset (in case of misconfigured permissions)
- Small  footprint (Alpine-based)
- Mutliarch

**Restrictions:**
- Lacks name-resolution-capabilities (mDNS), network printers have to be added manually
- PAM-authentication is not availabe
- Ingress doesn't work
- Only tested with USB-printers
- No additional preinstalled drivers (use PPD-files)

## Installation

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Example" add-on.
1. Check the logs of the "Example" add-on to see it in action.

## Usage

Open `https://[HOSTNAME]:631` to access the CUPS-webinterface, edit teh configuration-file as needed.

## Support

- none

## Authors & contributors

The original author of this repository is [Switch][author].

For a full list of all authors and contributors, check [the contributor's page][contributors].

## License

GPL Version 3

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://localhost:8123
[author]: https://github.com/Switch123456789
[contributors]: https://github.com/Switch123456789/REPO/graphs/contributors
[issue]: https://github.com/Switch123456789/REPO/issues
[releases]: https://github.com/Switch123456789/REPO/releases
