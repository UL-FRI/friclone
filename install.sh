#!/bin/sh

# create /usr/local subdirectories if they don't exist yet
{
mkdir -p /usr/local/bin
mkdir -p /usr/local/share/home_clone
} > /dev/null 2>&1

cp pam_script_ses_open /usr/share/libpam-script
cp home_clone home_clone_clean home_clone_fix /usr/local/bin
cp share/* /usr/local/share/home_clone

