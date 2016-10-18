# Getting started with CamFlow

CamFlow has been built and tested with Fedora 23 ([Download here](https://getfedora.org/)).
CamFlow should work with other Linux distributions, but we make no guarantee.

CamFlow's source code and patch notes can be found [here](https://github.com/camflow/camflow-dev).

## Limitations

CamFlow is not yet feature complete, please visit [our website](http://camflow.org/) for more information.

## Installing dependencies

``` shell
sudo dnf groupinstall 'Development Tools'
sudo dnf install ncurses-devel cmake clang gcc-c++ wget git openssl-devel zlib
```

**WARNING**: package names and the package manager may vary across distribution.
Please refer to your distribution documentation for the equivalent packages.

## Building and installing CamFlow

``` shell
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
