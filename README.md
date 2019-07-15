# firefox-stable

This docker image provide the [latest stable firefox release](https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US), and the libraries it needs to run a pure wayland host.

It's intended to be launched using [x11docker](https://github.com/mviereck/x11docker). I personally use

```
x11docker --pulseaudio --pw sudo -H -W -m -- --shm-size=4G -- d4delta/firefox-stable
```

`--shm-size=4G` is needed because firefox use a lot of ipc; You can lower it, but it may cause tab crashes, and random firefox crashes. If you don't open a lot of tabs, you'll probably safe with `1G`or even `512m`.

