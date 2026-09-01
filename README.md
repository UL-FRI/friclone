# frihomeclone

The system used for btrfs-snapshotted homes on classroom computers


## Installation

The quick way to install `frihomeclone` is to run `install.sh` as root. More details are below.

The executables `home_clone`, `home_clone_fix` and `home_clone_clean` go into `/usr/local/bin`, 
the PAM script `pam_script_ses_open` goes into `/usr/share/libpam-script` and the files in 
`share` go into `/usr/local/share/home_clone`. Executables and the PAM script all need 
proper permissions to execute, while files in `share` can be read-only.

There should be a user `asistent` with the primary group `asistent` and home directory
`/home/asistent` that acts as the "prototype" which is the base of all other homes. 
The user, group and home directory can be changed in `home_clone` and `home_clone_fix`.
The location of the target user's home directory is assumed to be somewhere in `/home`
or any directory of the form `/foo/bar/home`. The remote-mounted directory (perhaps 
through SMB or NFS) with user homes should have the same parent directory as the local
home and also have the same child directory structure. E.g. if the user's local home
is `/home/user`, then the remote home should be `/remote_home/user`, of it the local
home is `/foo/bar/home/baz/user`, then the remote home should be `/foo/bar/remote_home/baz/user`.

## Usage

On every login, `pam_script_ses_open` executes `home_clone_clean` to reset home directories
from the previous session, then runs `home_clone` to recreate the user's home directory 
from the prototype home (user `asistent` by default). User's preferences, custom settings,
VS Code extensions etc. are preserved across logins, while essentials are reset on
every login to keep the system in a usable state.

Logs are saved to `/var/log/home_clone.log`.
