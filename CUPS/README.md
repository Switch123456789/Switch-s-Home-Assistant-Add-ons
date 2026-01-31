## Home Assistant App: CUPS
![](logo.png)

### Features
- Hosts a [CUPS](https://www.cups.org/) Server
- Detects printers connected to Home Assistants host system.
- Announces printers on the local network over mDNS (zeroconf/avahi)

### Restrictions
- Can announce but not discover printers using mDNS
- Only stock and brother printers are preinstalled (Create an issue to request another package)
- No Ingress (yet?)

## Help
### Installation
1. Click: [![SHOW ADD-ON ON MY HOME ASSISTANT](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=e34e2f70_cups&repository_url=https%3A%2F%2Fgithub.com%2FSwitch123456789%2FHome-Assistant-Apps)
2. Click OK on the pop-up to add my repo to Home Assistant
3. Click install

### More infos
- **Webinterface:** Can be accessed by navigating to `https://[HOSTNAME]:631`
- **Config-files:** Can be accessed through `addon_configs`-folder
- **More infos:** Are on [the repo add-on-page](https://github.com/Switch123456789/Home-Assistant-Apps)