# Getting started with CamFlow

CamFlow has been built and tested with Fedora 23 ([Download here](https://getfedora.org/)).
CamFlow should work with other Linux distributions, but we make no guarantee.

CamFlow's source code and patch notes can be found [here](https://github.com/camflow/camflow-dev).

# Build Status

| Branch | Status                                                                                  |
|--------|-----------------------------------------------------------------------------------------|
| master | [![Master Build Status](https://api.travis-ci.org/CamFlow/camflow-install.svg)](https://travis-ci.org/CamFlow/camflow-install/branches)  |

Automated Travis test verifies:
- verifies that the latest release build.

## Installing dependencies

### Fedora

``` shell
sudo dnf groupinstall 'Development Tools'
sudo dnf install ncurses-devel cmake clang gcc-c++ wget git openssl-devel zlib patch mosquitto
```

### Ubuntu
``` shell
sudo apt-get -y install build-essential
sudo apt-get -y install libncurses-dev cmake clang g++ wget git libssl-dev bc nano patch mosquitto
```

**WARNING**: package names and the package manager may vary across distribution.
Please refer to your distribution documentation for the equivalent packages.

## Building and installing CamFlow

``` shell
git clone https://github.com/CamFlow/camflow-install.git
cd camflow-install
make all
```

This will build and install the CamFlow Linux Security Modules as well as the userspace tools.
The whole installation procedure may take a huge amount of time.
The installation process may ask for root password.

Early during the process, the kernel configuration menu should appear.
Under the security tab, select `CamFlow - Provenance` from the list.
It should look like this:

![Instalation menu](https://raw.githubusercontent.com/CamFlow/camflow-install/master/img/install.png)

Note that CamFlow can run alongside SELinux or other security modules.

**WARNING:** You need to reboot your machine after installation.

``` shell
sudo reboot now
```

## Versions

Please check this [link](https://github.com/CamFlow/camflow-dev/blob/master/CHANGES.md) for information about CamFlow releases.

It is possible to install a particular version as follows:
``` shell
make v0.1.0 # replace v0.1.0 by the desired version
```
