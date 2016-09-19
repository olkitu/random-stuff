# Host File for Ads and tracking blocking

Suomalaisille käyttäjille tarkoitettu mainosten ja tracking eli jäljitteiden estoon tarkoitettu host tiedosto. Estää suurimman osan suosittujen verkkosivujen mainosten latautumisen.

Tuki IPv4 + IPv6 osoitteille. 

Vapaasti ladattavissa ja forkattavissa eteenpäin. 

## Ei toimi:

* Youtube Android / iOS sovelluksissa. Näkyy mainokset ajoittain. Toimii selaimella ja Chromecastissä.
* Katsomo.fi... Mainosten esto estää videoiden näkyvyyden ja mahdollisesti mainoksien esto aiheuttaa muissa sivuissa rikkoutumista.
* Ruutu ei toimi jos käytät tätä listausta - Palvelu tarkistaa ladataanko mainokset vai ei...

## Scripti automaattiseen päivitykseen

Lisää tämä croniin... Dnsmasq on uudelleenkäynnistettävä kun on ladannut uusimman version host tiedostosta

```
wget https://raw.githubusercontent.com/olkitu/random-stuff/master/hosts-file/hosts.txt -p /tmp/
sudo service dnsmasq restart
```

Lisää croniin että ajaa kerran päivässä esimerkiksi

```
0 0     * * *   user  /opt/dnsmasq.sh
```
