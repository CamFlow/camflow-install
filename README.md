# Getting started with CamFlow

CamFlow has been built and tested with Fedora 23 ([Download here](https://getfedora.org/)).
It may work with other distributions but there is no guarantee.

CamFlow's source code and patch notes can be found [here](https://github.com/camflow/camflow-dev).

## Limitations

CamFlow is not yet feature complete ([please visit](http://camflow.org/)).
Release 0.1.0 does not support persistence of security context across reboot, lacks proper userspace management tools, audit format is unconsistent and the code is probably buggy;).
However, we are working hard and this should improve in the future.
For more details please visit [here](https://github.com/camflow/camflow-dev).

## Installing dependencies

``` shell
sudo dnf groupinstall 'Development Tools'
sudo dnf install ncurses-devel cmake clang gcc-c++ wget git openssl-devel
```
## Building and installing CamFlow

``` shell
make all
```

This will build and install the CamFlow Linux Security Modules as well as the userspace tools.
The whole installation procedure may take a huge amount of time.
The installation process may ask for root password during the process.
It is also possible to install a particular version as follows:

``` shell
make v0.1.2 # replace v0.1.0 by the desired version
```

Early during the process, the kernel configuration menu should appear.
Under the security tab, select Provenance and IFC from the list.
It should look like this:

![Instalation menu](https://raw.githubusercontent.com/CamFlow/camflow-install/master/img/install.png)

Note that CamFlow can run alongside SELinux or other security modules.

## Versions

| CamFlow version | Kernel version | Date       |
| --------------- |----------------| ---------- |
| 0.1.3           | 4.4.6          | 08/08/2016 |
| 0.1.2           | 4.4.6          | 26/05/2016 |
| 0.1.1           | 4.4.6          | 03/04/2016 |
| 0.1.0           | 4.2.8          | 28/03/2016 |
