# About starterkit-embedded-erni-yocto

The Erni Embedded Community have developed a embedded GNU/Linux distribution. It is a distribution intended to start and learn all about Yocto/poky. We would like to see your contributions in this distribution. With these contributions it will a plenty-of-features distribution. We have called it **Ideafix**.

Why?
Because Ideafix is the most loyal Operative System of our Gaulish village aka Erni Embedded Community.

<img src="https://residenciacaninaidefix.com/wp-content/uploads/2018/10/idefix.jpeg" width="150">

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## Features

- This yocto layer contains the minimal configuration to start working with Yocto/poky
- It builds an image ( bootloader + sourcetree + initramfs + kernel + partition table + rootfs ) which can be used to boot a Raspberry Pi 3b+/4
- The image can be tested on a virtual machine based on Qemu

## Prerequisites

**Host OS**

Ubuntu 22.04 and 20.04 are elegibles as Host OS.

## Installation

1. Install the depencencies

```bash
sudo apt install gawk wget git-core git diffstat unzip texinfo build-essential chrpath socat cpio python3 python3-pip zstd libsdl1.2-dev xterm make xsltproc docbook-utils fop dblatex xmlto libssl-dev pv

pip3 install kas==3.0.2
```

2. Clone the repo

```bash
git clone https://github.com/ERNI-Academy/starterkit-embedded-erni-yocto.git
```

## Getting Started

1. Checkout layers.
```
kas checkout conf/ideafix.yml
```

2. Init bitbake (open-embedded) environment.
```bash
source sources/poky/oe-init-build-env raspberrypi3
# Fill the local.conf with the starting configuration
cat ../conf/local.conf > conf/local.conf
cat ../build/conf/local.conf >> conf/local.conf
cp ../build/conf/bblayers.conf conf/bblayers.conf
```

3. Build the image (this could take several hours)
```bash
bitbake core-image-minimal
```

4. Test the "image" (kernel+initramfs+rootfs)
```bash
runqemu
```

## Contributing

Please see our [Contribution Guide](CONTRIBUTING.md) to learn how to contribute.

## License

![MIT](https://img.shields.io/badge/License-MIT-blue.svg)

## Code of conduct

Please see our [Code of Conduct](CODE_OF_CONDUCT.md)

## Stats

Check [https://repobeats.axiom.co/](https://repobeats.axiom.co/) for the right URL

## Follow us

[![Twitter Follow](https://img.shields.io/twitter/follow/ERNI?style=social)](https://www.twitter.com/ERNI)
[![Twitch Status](https://img.shields.io/twitch/status/erni_academy?label=Twitch%20Erni%20Academy&style=social)](https://www.twitch.tv/erni_academy)
[![YouTube Channel Views](https://img.shields.io/youtube/channel/views/UCkdDcxjml85-Ydn7Dc577WQ?label=Youtube%20Erni%20Academy&style=social)](https://www.youtube.com/channel/UCkdDcxjml85-Ydn7Dc577WQ)
[![Linkedin](https://img.shields.io/badge/linkedin-31k-green?style=social&logo=Linkedin)](https://www.linkedin.com/company/erni)

## Contact

📧 [esp-services@betterask.erni](mailto:esp-services@betterask.erni)

## Contributors ✨

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
