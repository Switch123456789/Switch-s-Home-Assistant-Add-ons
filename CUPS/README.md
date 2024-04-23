# Home Assistant Community Add-on: CUPS

Hosts a [CUPS](https://www.cups.org/) Server to enable printer sharing to the local network.

![aarch64: yes](https://img.shields.io/badge/aarch64-yes-green.svg)
![amd64: yes](https://img.shields.io/badge/amd64-yes-green.svg)
![armhf: yes](https://img.shields.io/badge/armhf-yes-green.svg)
![armv7: yes](https://img.shields.io/badge/armv7-yes-green.svg)
![i386: yes](https://img.shields.io/badge/i386-yes-green.svg)

**Features:**
- Printer announcement on the local network using zeroconf/avahi
- Customizable cupsd.conf through CUPS-webinterface
- Option to reset cupsd.conf to regain access (in case of misconfiguration)

**Restrictions:**
- Can announce but not discover printers using mDNS
- No preinstalled drivers (PPD-file needed)
- No Ingress (yet?)

## Installation

- Click the button below to open the add-on in your Home Assistant instance.

[![SHOW ADD-ON ON MY HOME ASSISTANT](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_cups&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons)
  
## Usage

Open `https://[HOSTNAME]:631` to access the CUPS-webinterface, edit the configuration-file as needed.

## Support

- [Discuss the addon here](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/discussions)

- [Report a bug or request a feature here](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons/issues)