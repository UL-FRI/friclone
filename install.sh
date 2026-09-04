#!/bin/sh

# create /usr/local subdirectories if they don't exist yet
{
mkdir -p /usr/local/bin
mkdir -p /usr/local/share/home_clone
} > /dev/null 2>&1

cp pam_script_ses_open /usr/share/libpam-script
chown root:root /usr/share/libpam-script/pam_script_ses_open
chmod u+x /usr/share/libpam-script/pam_script_ses_open

cp home_clone home_clone_clean home_clone_fix /usr/local/bin
chown root:root /usr/local/bin/home_clone /usr/local/bin/home_clone_clean /usr/local/bin/home_clone_fix

cp share/* /usr/local/share/home_clone
chown root:root -R /usr/local/share/home_clone

touch /var/log/home_clone.log
chmod o+w /var/log/home_clone.log

