# fai config for ?
Neuer Versuch fai config files

START: Gnome computer from config space with fai installed. (not so easy if gnome with faime installed but possibe after installing missing packages)

With fai-diskimage (faiserver.bash) installed fai server.
Short test with fai-net (faiserver.bash)

Add ethernet interface as a bridge to faiserver (faiserver.bash). Install a new gnome computer form FAI. (Goto: START:) 

Use the SIMPLE branch for easy understanding fai config spaces. (Not as easy as possible in the moment. :-) )

# More infos only for me to remember. Sorry for German/Englisch mix.

git clone https://github.com/asc4asc/fai.config.git # config nach /srv/fai copieren oder link?

## ToDo
* Idee: Auf den Rechnern verschiedene Config Space oder Branch als Benutzer organisieren. z.B. faiserver, bridge, dhcpserver, ... faiorg .... 
* Verteilung der dateien/Änderungen und den Rücktransport ins git organisieren.
* Tastatur de wenigstens bei fai-disk dirinstall aus dem host auslesen und als Klasse übergeben. Klasse: KBDE
* Statt copieren besser link auf user home Verzeichniss mit git daten?

```
fai Server per diskimage installiert.

fai-me: Zusatzpakete: git / Password fai / User demo 
```
## Beachten
* gmrl
* web-fai
* fai softupdate

## Idee so
* Möglichts alles als Utility in /usr/local/ (möglichst hin und wieder entfernen?) (Wenn nötig doppelten Aufruf verhindern.) (Löschen wenn fertig?)
* Möglichst einfach passend zu Klassen z.B GNOME:GDM:EASYTEST.... Moeglichkeit alle Utilitys zum testen oder nur das was funktioniert laden.

## Gedanken zu Klassen
* FAI Klassen steuern den Installationsprozess. z.B FAIBASE, DEBIAN, BUSTER64
* Admin Klassen sagen wie wahrscheinlich konfigurirt wird. z.B. NETWORK(DHCPC), SYSTEMD, GDM, GNOME 
 * Alternative Admin KLassen z.B. Netzwerk: NETWORMANAGER,NETPLAN,INTERFACES,SYSTEMD (Steuerklasse: z.B. FIXIP)
* Steuer Klassen z.B. DEMO, LABOR, EASYTEST, ...

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

#### Aus fai-doc Help to find all classes.
```
If you want to find all files (except hostnames) that are classes try:
   find /srv/fai/config -type f | egrep '/[[:upper:][:digit:]_]+$'

In cfengine scripts you can find class names using:
   egrep -r '[[:upper:][:digit:]_]+::' /srv/fai/config

Shell scripts are using the commad ifclass. So use:
   egrep -r 'ifclass[[:space:]]+[[:upper:][:digit:]_]+' /srv/fai/config

```
In the log files? Internal Classes like DEFAULT,LINUX,AMD64,DHCPC,LAST 

#### Class config (files) ist wo möglich?
Alternativ:
* Configspace: class/50-host-classes
* Configspace: class/example.profile
* Im fai-diskimage aufruf.
In allen Files in Configspace: class autodetect z.b. EFI classes 

Selten benutzt:
Kernel comand line! (z.b. pxe boot) / Besser Rechername und dann 50-host-classes .... 


