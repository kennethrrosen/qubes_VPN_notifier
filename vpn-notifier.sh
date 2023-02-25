#!/bin/bash

# Get sys-vpn connection status
status=$(qvm-run --pass-io sys-vpn 'nmcli connection show --active | grep vpn | awk "{print \$NF}"')

# Get up/down statistics
statistics=$(qvm-run --pass-io sys-vpn 'nmcli connection show --active | grep -i rx | awk "{print \$2,\$4}"')

# Get connected IP and location
ip=$(qvm-run --pass-io sys-vpn 'curl -s ifconfig.me')
location=$(qvm-run --pass-io sys-vpn 'curl -s ipinfo.io/country')

# Construct notification message
message="VPN Connection Status: $status\nUp/Down Statistics: $statistics\nConnected IP: $ip\nLocation: $location"

# Display notification box
qvm-notify "$message"

