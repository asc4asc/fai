# fai
Neuer Versuch fai config files

git clone https://github.com/asc4asc/fai.config.git # config nach /srv/fai copieren.

Zum laufen bringen:
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
* Steuer Klassen z.B. DEMO, ...

