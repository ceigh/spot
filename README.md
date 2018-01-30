# Spot
![alt text](http://i99.fastpic.ru/big/2018/0130/ae/ed0995b3627dd06b17cc3c258ba6a1ae.png)

The tool for javascript mining in the web page of wi-fi network users.

The project is designed for the worldwide popularization of open access points for Wi-Fi.

Contact me:
- ceigh@protonmail.com

Installation
============

Just

`git clone https://github.com/ceigh/spot`

`cd spot`

`sudo bash install.sh`

Using
=====
Everything is simple:

`spot [option]`

Options
=================
- specify your **coinhive token**

`spot -t`

> this is the first thing you should do (if you are not going to mine for me) **;)**


- **run** (main option):

`spot -r`


- specify your **interface** (wlan0 by default)

`spot -i`

- change the listening **port** (53 by default)

`spot -p`
> use if you have some errors from MITMf


- change default **gateway** (192.168.0.1 by default)

`spot -g`


- see **help**

`spot -h`
> all commands are written here

Software
=====
This tool is using [MITMf](https://github.com/byt3bl33d3r/MITMf) and it's just a simplified version of the manual script injection.

Also, as a basis,  [Coinive](https://coinhive.com) script.
