# fai.config
Neuer Versuch fai config files: This branch should be as simple as possible but not simpler.

script/<classe>/filename sollte zu veraenderndes File enthalten und Zweck. 
  
Examples: good???
* 10-create-fai.config-for-softupdate 
* 09-add-loguser-to-fai.conf
* 70-set-hostname
* 80-add-hostname-to-hosts
* 11-misc-setup-fai / Fuer alles was noch nicht klar umrissen ist was es wo wofuer tut.

# Teste mal!
Feste IP Network Manager.
```
Die o.g. Veränderung des Abschnitts [ipv4] erreicht man durch diese Befehlsfolge:

nmcli> goto ipv4
nmcli ipv4> set method manual 
nmcli ipv4> set addresses 10.0.0.42/10
nmcli ipv4> set addresses 192.0.2.42/32
nmcli ipv4> set gateway  10.0.0.1
nmcli ipv4> set dns 192.0.2.222
nmcli ipv4> set dns 10.0.0.1
nmcli ipv4> save
nmcli ipv4> quit
```
