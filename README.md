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

| CamFlow version | Kernel version | Date       |
| --------------- |----------------| ---------- |
| 0.3.0           | 4.10.10        | 15/04/2017 |
| 0.2.3           | 4.9.13         | 09/03/2017 |
| 0.2.2           | 4.9.9          | 14/02/2017 |
| 0.2.1           | 4.9.5          | 03/02/2017	|
| 0.2.0           | 4.9.5          | 23/01/2017 |
| 0.1.11          | 4.4.36         | 05/12/2016 |
| 0.1.10          | 4.4.31         | 11/11/2016 |
| 0.1.9           | 4.4.28         | 28/10/2016 |
| 0.1.8           | 4.4.25         | 19/10/2016 |
| 0.1.7           | 4.4.23         | 04/10/2016 |
| 0.1.6           | 4.4.21         | 19/09/216  |
| 0.1.5           | 4.4.19         | 02/09/216  |
| 0.1.4           | 4.4.16         | 18/08/2016 |
| 0.1.3           | 4.4.6          | 08/08/2016 |
| 0.1.2           | 4.4.6          | 26/05/2016 |
| 0.1.1           | 4.4.6          | 03/04/2016 |
| 0.1.0           | 4.2.8          | 28/03/2016 |

It is possible to install a particular version as follows:
``` shell
make v0.1.0 # replace v0.1.0 by the desired version
```
