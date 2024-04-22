# Home Assistant Community Add-on: CUPS

Hosts a [CUPS](https://www.cups.org/) Server to enable printer sharing to the local network.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

**Features:**
- Printer Announcement on the local network using zeroconf/avahi
- Customizable cupsd.conf through CUPS-webinterface
- Option to reset cupsd.conf to regain access (in case of misconfiguration)

**Restrictions:**
- Lacks name-resolution-capabilities (mDNS), network printers have to be added manually
- Ingress doesn't work
- No additional preinstalled drivers (use PPD-files)

## Installation

- Click the button below to open the add-on in your Home Assistant instance.

  [![addon-badge]][addon]

## Usage

Open `https://[HOSTNAME]:631` to access the CUPS-webinterface, edit teh configuration-file as needed.

## Support

- [Discuss the addon here][discussions]

- [Report a bug or request a feature here][issue]

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://localhost:8123
[discussions]: https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/discussions
[issue]: https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/issues

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg