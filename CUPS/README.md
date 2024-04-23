# Home Assistant Community Add-on: CUPS
### Features
- Hosts a [CUPS](https://www.cups.org/) Server
- Enables printer sharing to the local network.
- Announces printers on the local network over mDNS (zeroconf/avahi)
- `cupsd.conf` is customizable through the CUPS-webinterface
- `cupsd.conf` optionally can be restored to regain access (in case of misconfiguration)

### Restrictions
- Can announce but not discover printers using mDNS
- No preinstalled drivers (PPD-file needed)
- No Ingress (yet?)


# Help
### Installation
1. [![SHOW ADD-ON ON MY HOME ASSISTANT](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_cups&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FSwitch-s-Home-Assistant-Add-ons)
2. Click OK on the pop-up to add my repo to Home Assistant
3. Click install

### Configuration
- **Access the CUPS-webinterface** by navigating to `https://[HOSTNAME]:631` and edit the configurations as needed.
- **Reset the configuration if necessary** by checking the appropriate box on the add-on configuration-page.

### More infos
- [Repo add-on-page](https://github.com/Switch123456789/Switch-s-Home-Assistant-Add-ons)