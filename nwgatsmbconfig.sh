echo "######### Nwgat.net Samba Configurator #########"
echo ""
echo "workgroup"
read  workgroup
echo "netbios name"
read netbiosname
echo "share path"
read  sharepath

echo "[global]
workgroup = $workgroup
netbios name = $netbiosname
server string = Samba Server %v
map to guest = Bad User
log file = /var/log/samba/log.%m
max log size = 50
socket options = IPTOSLOWDELAY TCPNODELAY
preferred master = No
local master = No
dns proxy = No
security = User

[data]
path = $sharepath
valid users = @smb-users
read only = No
create mask = 0777
directory mask = 0777" > /etc/samba/smb.conf
echo ""
echo "### Samba is now setup ###"
echo "netbios name: $netbiosname"
echo "workgroup: $workgroup"
echo "share path: $shareparth"
