# friclone
Tools for live cloning and updating of (classroom) computers. Similar to [Snapper](http://snapper.io/), but with restore-on-boot and some tools to distribute the snapshots to multiple workstations.

## Installation

Just copy the executable to /usr/local/bin. If you want restore-on-boot, also make sure it is included in the initial ramdisk.

```
# install friclone
cp friclone /usr/local/bin
# enable restore-on-boot
cp friclone /etc/initramfs-tools/scripts/local-premount/friclone-initrd
update-initramfs
# 
```

## Usage

### Common usage

#### Add (Enroll) volumes to be snapshotted

```
friclone enroll /
```

#### Create snapshot

```
friclone snapshot /
```

#### List snapshots

```
friclone list /
```

#### Switch to (restore) snapshot (for next boot)

```
friclone switchto / 2026-01-01T12:13:24+00:00
```

#### Freeze system

```
friclone name / 2026-01-01T12:13:24+00:00 stable
```

#### Prototype to server

On prototype:

```
friclone snapshot /
```

On server:

```
friclone-pull / username@prototype.example.com sudo
```

#### Server to classroom computers

```
friclone receive / file:///path/to/snapshots remember
```

After this works once, you can just use:

```
friclone receive /
```

## Development

The software in this repository is used at the [Faculty of Computer and Information Science](https://fri.uni-lj.si) and is actively tested in our environment. We use [Debian](https://debian.org) or [Ubuntu](https://ubuntu.com).

Most of the heavy lifting (snapshot and restore) is done by a single POSIX shell script. This script must work in [BusyBox](https://busybox.net/) inside the [initial ram disk](https://wiki.debian.org/initramfs). The transfer of snapshots from a prototype computer to a server and from the server to clients is done by a separate posix shell script. The software should therefore work with most distributions.

Patches to make the software work with other distributions are welcome.

## Dependencies

The script requires btrfs-tools and a posix shell. If snapshots are stored on a webserver, the wget command should be available. The wget in busybox is sufficient.
Currently, the software only supports BTRFS.
