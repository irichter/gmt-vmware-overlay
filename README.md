gmt-vmware-overlay
==================

vmware-workstation hacks for Gentoo

This overlay contains modified versions of upstream
Gentoo's ```app-emulation/vmware-*``` ebuilds.  The
"meat" is in ```app-emulation/vmware-modules``` which
contains patches to compile vmware-modules against
recent kernels.

For reasons I struggle to fathom, VMWare only provides
the glue to compile their modules for crusty, ancient
linux kernels.  Usually, by the time I discover an
incompatibility, there is already a patch out there
somewhere on the internet, or an obvious fix I can
implement myself.

The ebuild documents and automates what I've been
able to figure out.  Often what's here will lag
behind upstream.  Not much I can do about this, as
I'm only likely to discover a problem once I rsync
my tree and/or upgrade to a new-enough kernel.  In
general, I don't run a new kernel version until it's
had several point revisions, so if you want smooth
sailing with this overlay, it's probably best to
implement a similar policy for your own kernel
upgrading.

To add this overlay to a Gentoo system, install layman
and run the following command as root:

```bash
layman -o https://raw.github.com/gmt/gmt-vmware-overlay/master/overlay.xml -a gmt-vmware
```
