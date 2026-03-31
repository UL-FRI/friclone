# friclone
Tools for live cloning and updating of (classroom) computers. Similar to [Snapper](http://snapper.io/), but with restore-on-boot and some tools to distribute the snapshots to multiple workstations.

## Installation

## Usage

## Development

The software in this repository is used at the [Faculty of Computer and Information Science](https://fri.uni-lj.si) and is actively tested in our environment. We use [Debian](https://debian.org) or [Ubuntu](https://ubuntu.com).

Most of the heavy lifting (snapshot and restore) is done by a single POSIX shell script which must be simple enough to be run by [BusyBox](https://busybox.net/) inside the [initial ram disk](https://wiki.debian.org/initramfs). The transfer of snapshots to a server and from the server to clients is done by Python scripts with minimal depencencies. The software should therefore work with most distributions.

Patches to make the software work with other distributions are welcome.

## Dependencies

Currently, the software only supports BTRFS.
