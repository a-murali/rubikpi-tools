echo 1. Delete any active connections
sudo ifconfig wlan0 down
sudo nmcli connection delete RUBIKPi_AP_146
sudo nmcli connection delete "UCSD-GUEST 1"
sudo nmcli connection delete "Mesa Nueva Guest 1"
sudo nmcli connection delete "UGV"
nmcli connection show --active

echo 2. Add WiFi connection to wlan0
sudo iw dev wlan0 interface add ap0 type __ap
sudo sleep 10
sudo nmcli device wifi connect "$1"

echo 3. Set up ap0 connection
sudo nmcli connection add type wifi ifname ap0 con-name RUBIKPi_AP_146 ssid RUBIKPi_AP_146 mode ap
sudo iw dev wlan0 interface add ap0 type __ap
sudo nmcli connection up RUBIKPi_AP_146
