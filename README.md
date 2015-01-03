gmt-vmware-overlay is no longer maintained
==========================================

I am no longer maintaining this overlay as I have finally
been able to move away from the workstation platform.

Unfortunately, upstream (gentoo-x86) maintainership of
vmware remains so spotty that reporting bugs is not an
effective way to solve problems.

Therefore, the best practice I can advise is to download upstream's
latest ebuilds, review the commit history of this repository, and merge
into a fork.  Better yet, get yourself set up as a full Gentoo developer
and become the maintainer!  I'm sure lots of people would thank you.

Personally, I'm migrating all my in-house systems and as many of my
clients as possible to non-vmware virtualization platforms and, without
the incentive of dog-food, I know I'd be a terrible steward of this thing,
hence this pronouncement of official abandonment.

This overlay contains modified versions of upstream
Gentoo's ```app-emulation/vmware-*``` ebuilds.  The
"meat" is in ```app-emulation/vmware-modules``` which
contains patches to compile vmware-modules against
recent kernels.

To add this overlay to a Gentoo system, install layman
and run the following command as root:

```bash
wget https://raw.github.com/gmt/gmt-vmware-overlay/master/gmt-vmware.xml -O /etc/layman/overlays/gmt-vmware.xml
layman -a gmt-vmware
```
