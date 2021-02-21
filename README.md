# fai
Neuer Versuch fai config files

git clone https://github.com/asc4asc/fai.config.git # config nach /srv/fai copieren.

## ToDo
* Geht das? Git technik "late branch" "tag" "work in main" problem rename main to tag.
* Idee: Auf den Rechnern verschiedene Config Space oder Branch als Benutzer organisieren. z.B. faiserver, bridge, dhcpserver, ... faiorg .... 
* Verteilung der dateien/Änderungen und den Rücktransport ins git organisieren.
* split der faiserver.bash datei in generate teil und start clients teil.
* faiserver eigenständig betreiben nicht immer neu erzeugen auch fai config space dort verwalten.

#### zum laufen bringen:
* Debian 10 per faime installiert dann git ....
* fai-diskimage / auch als raw und dann per dd if=fai-gnomehost-buster64.raw of=/dev/device status=progress
* Update des images auf "bullseye"
```
fai Server per diskimage installiert.

So etwas wie faime um z.B. neuen usbstick zu generieren. Oder wirtuelle maschine

fai-me: Zusatzpakete: git / Password fai / User demo 
```
## Beachten
* gmrl
* web-fai
* fai softupdate

## Idee so
* Möglichts alles als Utility in /usr/locasl/ (moeglichst hin und wieder entfernen) (Wenn nötig doppelten Aufruf verhindern.) (Löschen wenn fertig?)
* Möglichst einfach passend zu Klassen z.B GNOME:GDM:EASYTEST.... Moeglichkeit alle Utilitys zum testen oder nur das was funktioniert laden.

## Gedanken zu Klassen
* FAI Klassen steuern den Installationsprozess. z.B FAIBASE, DEBIAN, BUSTER64
* Admin Klassen sagen wie wahrscheinlich konfigurirt wird. z.B. SYSTEMD, GDM 
 * Alternative Admin KLassen: NETWORMANAGER,NETPLAN,INTERFACES,SYSTEMD
* Steuer Klassen z.B. DEMO, ...

## Config var File
* SC5,SC6,PC6,Laptop,... Seriennummer?
* ? Ziel Distribution ? 
#### Was braucht man typischer Weise?
Verbindung zum Internet ????
Hier könnte man nach bekannten vorhanden Interfaces entscheiden. z.B ist enp0s31f6 oder wlp6s0 ..... da nutze diese. Evtl noch weitere Tests linkup?  
Verbindung fuer die Bridge um externe Computer zu verbinden.
```
INET=" wlp6s0 " # Wlan laptop
# INET="enp4s0" # SC5 Port unten  
# INET="enp0s31f6" # SC5 Port oben

USERNAME="demo"
GROUPNAME="demo"
USERNAME="$USER"
GROUPNAME="$USER" # not correct but ....
COMPHOSTNAME="faiserver"
```
