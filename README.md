# Terratec-Cinergy-TC2 Linux kernel

This is a build script to build the debian kernel with support for the Terratec-Cinergy-TC2 DVB-USB-Stick.
It is only tested under Debian Buster.

<aside class="warning">
This is only for testing purposes. The patch contains a lot of hacky workarounds.
Please review the patch and script before you build and use a kernel.

Any use of these scripts and patches is at your own risk.
</aside>

## Preparation

Pbuilder needs to be root to build packages.
You need to create a pbuilder base.tgz.::

    # pbuilder create --distribution buster --mirror https://deb.debian.org/debian

## Build

Than you can run the build script.::

    # ./build.sh

## Installation

If no error occured, you can install the kernel of your choice.::

    $ ls /var/cache/pbuilder/result/linux-image-*-amd64_*_amd64.deb
    # dpkg -i /var/cache/pbuilder/result/linux-image-...
