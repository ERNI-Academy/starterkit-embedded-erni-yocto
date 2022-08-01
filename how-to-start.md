## Host OS

Ubuntu 22.04 and 20.04 are elegibles as Host OS.

## Install dependences
sudo apt install gawk wget git-core diffstat unzip texinfo build-essential chrpath socat cpio python3 python3-pip zstd libsdl1.2-dev xterm make xsltproc docbook-utils fop dblatex xmlto libssl-dev pv

pip3 install kas==3.0.2

## Checkout layers

kas checkout conf/ideafix-rpi3.yml

## Init oe environment

source sources/poky/oe-init-build-env raspberrypi3
