# About starterkit-embedded-erni-yocto (AKA ideafix)

The Erni Embedded Community has developed **Ideafix**, an embedded GNU/Linux distribution. It
is intended to get started about _yocto/poky_, and learn as much as possible about it. We'd love
to get your contributions so that it becomes a features-plenty distribution.

Why *Ideafix*? Because Ideafix is the most loyal Operative System of our Gaulish village
aka _Erni Embedded Community_.

<img src="idefix.jpeg" width="150">

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## features

- this yocto layer contains the minimal configuration to start working with yocto/poky
- it builds an image (bootloader + sourcetree + initramfs + kernel + partition table +
rootfs) which can be used to boot a Raspberry Pi 3b+/4
- the image can be tested on a on Qemu-based virtual machine


## prerequisites (host OS)

Both Ubuntu 22.04 and 20.04 are elegible as host OS.


## installation

Get the apt required packages + repo cloning.


### get required packages

The following commands are required to get the apt packages.

```bash
sudo apt update

sudo apt install \
    gawk wget git-core git diffstat unzip build-essential chrpath socat cpio \
    python3 python3-pip zstd libsdl1.2-dev xterm make xsltproc fop xmlto libssl-dev pv \
    docbook-utils texinfo dblatex 

pip3 install kas==3.0.2
```

### clone the repo

Clone the ideafix repo, then cd to the cloned repo folder.

```bash
git clone https://github.com/ERNI-Academy/starterkit-embedded-erni-yocto.git
cd starterkit-embedded-erni-yocto.git
```

## generation

This project uses KAS to generate and build the image. KAS is a wrapper for the
yocto bitbake standard tool, that makes things easier for newcomers to yocto. It
uses yml files as input, and from there it downloads the required repositories, and
generates the bitbake recipes & output folders.

The generation consists in checking out the _ideafix_ configuration file, and then
issuing the corresponding build command, that in ideafix can either be for qemu or rPI.


### layers checkout

The first thing to do is to checkout the main kas file, in our case, `ideafix.yml`.

```bash
kas checkout conf/ideafix.yml
```

This will download all the necessary yocto stuff.

The checkout command does not need to be executed on different sessions, it has
persistency on the same repo clone folder. It is only required to be re-executed when
you know an update of the yocto is needed.


### image build

The image can be built both for rPI (ARM cross-compiling) and for qemu (native simulation). The
rPI build generates a file that can be flashed into a microSD disk that can be inserted into 
the rPI. It is suggested to start with the qemu for the first build, and then the successive
experimental changes.

The build folder is the one pointed to by the `KAS_BUILD_DIR` environment variable. Examples:

```bash
export KAS_BUILD_DIR=build_branch2
export KAS_BUILD_DIR=build_featureX
```

This variable has to be set on every session. Otherwise the output will be in the `build` folder.

```bash
# build the image for testing in qemu
kas build conf/qemu.yml

# build the image for deploying in the raspberry pi3
kas build conf/rpi3.yml
```

Clarification: In case you are familiar with bitbake (yocto's default tool) the 2
above `kas` commands are equivalent to the following `bitbake` commands:

```bash
kas shell conf/qemu.yml -c "bitbake core-image-minimal"

kas shell conf/rpi3.yml -c "bitbake core-image-minimal"
```

> Note: The build process may take several hours. The build cache is stored in the
> `sstate` folder. The first of each rpi3 and qemu builds will take a lot of time, but
> subsequent ones, specially if changes are small, will take much less, even if the
> output folder is changed.


## test & deployment

Once the images are built, it is possible to either test the generated qemu or deploy to rPI.

It is important to set again the `KAS_BUILD_DIR` var in case the build was performed in a 
different shell session.

### qemu verification

To run the image with qemu, execute the following commands depending if a GUI frontend is
desired or not.

```bash
kas shell conf/qemu.yml -c "runqemu qemuarm serialstdio"

kas shell conf/qemu.yml -c "runqemu qemuarm serialstdio nographic"
```

Then it is possible to login with the _root_ user or even to ssh to the qemu machine
address.

In order to properly stop the qemu it is best to issue the `shutdown` command (inside
the qemu!).



### rpi deployment

Once the image has been satisfactorily tested, it is now possible to deploy it
with the `getImageReady2Flash.sh` script. The images files are located in
`tmp-glibc/deploy/images/raspberrypi3` below the build folder.


## contributing

Please see our [Contributing Guide](CONTRIBUTING.md) to learn how to contribute.


## license

![MIT](https://img.shields.io/badge/License-MIT-blue.svg)


## code of conduct

Please see our [Code of Conduct](CODE_OF_CONDUCT.md)


## stats

Check [https://repobeats.axiom.co/](https://repobeats.axiom.co/) for the right URL


## follow us

[![Twitter Follow](https://img.shields.io/twitter/follow/ERNI?style=social)](https://www.twitter.com/ERNI)
[![Twitch Status](https://img.shields.io/twitch/status/erni_academy?label=Twitch%20Erni%20Academy&style=social)](https://www.twitch.tv/erni_academy)
[![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UCkdDcxjml85-Ydn7Dc577WQ?label=Youtube%20Erni%20Academy&style=social)](https://www.youtube.com/channel/UCkdDcxjml85-Ydn7Dc577WQ)
[![Linkedin](https://img.shields.io/badge/linkedin-31k-green?style=social&logo=Linkedin)](https://www.linkedin.com/company/erni)


## contact

📧 [esp-services@betterask.erni](mailto:esp-services@betterask.erni)


## contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/Gmatarrubia"><img src="https://avatars.githubusercontent.com/u/7702234?v=4" width="100px;" alt=""/><br /><sub><b>gmatarrubia</b></sub></a><br /><a href="https://github.com/Gmatarrubia" title="Code">💻</a> <a href="#content-gmatarrubia" title="Content">🖋</a> <a href="https://github.com/ERNI-Academy/starterkit-embedded-erni-yocto//commits?author=gmatarrubia" title="Documentation">📖</a> <a href="#design-gmatarrubia" title="Design">🎨</a> <a href="#ideas-gmatarrubia" title="Ideas, Planning, & Feedback">🤔</a> <a href="#maintenance-gmatarrubia" title="Maintenance">🚧</a> <a href="https://github.com/ERNI-Academy/starterkit-embedded-erni-yocto//commits?author=gmatarrubia" title="Tests">⚠️</a> <a href="#example-gmatarrubia" title="Examples">💡</a> <a href="https://github.com/ERNI-Academy/starterkit-embedded-erni-yocto//pulls?q=is%3Apr+reviewed-by%3gmatarrubia" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

