# Ubuntu GUI commands:

## Source: [Video](https://www.youtube.com/watch?v=IL7Jd9rjgrM&ab_channel=DavidBombal)

### Command Line
```sh
sudo apt update && sudo apt -y upgrade
sudo apt-get purge xrdp
sudo apt install -y xrdp
sudo apt install -y xfce4
sudo apt install -y xfce4-goodies

sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g'
/etc/xrdp/xrdp.ini
echo xfce4-session > ~/.xsession

sudo nano /etc/xrdp/startwm.sh
```
### Comment these lines (startwm.sh):
```sh
# test -x /etc/X11/Xsession && exec /etc/X11/Xsession
# exec /bin/sh /etc/X11/Xsession
```
### Add these lines:
```sh
# xfce
startxfce4
```

### Command Line
```sh
sudo /etc/init.d/xrdp start
```

### Fix to allow for multiple xrdp sessions - [Black Screen Fix](http://catch22cats.blogspot.com/2018/05/xrdp-blank-screen-with-ubuntu-1804.html)
#### Add before the commented lines above
```sh
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR
. $HOME/.profile
```
