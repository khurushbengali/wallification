<p align="center"><img src="https://raw.githubusercontent.com/khurushbengali/wallification/master/screenshots/wallification-icon.png" width="130"></p>
<h2 align="center">Wallification - Live Wallpapers for Linux</h2>



## What is Wallification?

Wallification Desktop Management Application (WDMA) is a wallpaper manager application.
This application allows the users to use images as well as videos as wallpapers.
Widgets system is also available, a straight forward GUI for editing.
Wallification Wallpaper Creator (WWC) is an application which will allow the user to add their own personalized wallpapers.

![s1](https://raw.githubusercontent.com/khurushbengali/wallification/master/screenshots/collage.jpg)



## How do I install Wallification?

### Manual Installing

Run the following:
```
sudo add-apt-repository ppa:vala-team -y
sudo apt install cmake valac libgtk-3-dev libgee-0.8-dev libclutter-gtk-1.0-dev libclutter-1.0-dev libwebkit2gtk-4.0-dev libclutter-gst-3.0-dev gstreamer1.0-libav
git clone https://github.com/khurushbengali/wallification.git
cd wallification
mkdir build && cd build
cmake .. && sudo make install && ./wallification
```



## Uninstall

1. Open Terminal
2. `cd wallification/build`
3. `sudo make uninstall`



## Status of Development

Wallification still receives updates but they are not as frequent due to my involvement in other open-source projects.


