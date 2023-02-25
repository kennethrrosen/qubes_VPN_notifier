# qubes_VPN_notifier
A simple script to prompt users to IP, location, and connection status. Modifies sys-vpn using [this](https://forum.qubes-os.org/t/how-to-setup-openvpn-fedora-appvm-for-ovpn/3354) guide as its base.

The repository's script uses the `qvm-run` command to execute commands on the `sys-vpn` qube and retrieve information about the VPN connection. The `qvm-notify` command is then used to display the information in a notification box. To make the script persistent, you can add it to a startup script in QubesOS.


1. Add the repository's script content to `/etc/qubes-rpc/` and make sure it's executable through `chmod +x`.
```
sudo nano /etc/qubes-rpc/vpn-notifier.sh
```

2. Create a new service file `/etc/systemd/system/vpn-notifier.service`. This file should contain the following:
```
[Unit]
Description=My Notification Service
After=qubesd.service

[Service]
ExecStart=/etc/qubes-rpc/my-notification-script
Type=simple

[Install]
WantedBy=default.target
```

3. Enable and start the service using the following commands:
```
sudo systemctl enable vpn-notifier-service
sudo systemctl start vpn-notifier-service
```
