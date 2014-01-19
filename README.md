# puppet-ssh

####Table of Contents

1. [Overview - What is the SSH module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with SSH](#setup)
4. [Usage - The classes, defined types, and their parameters available for configuration](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

The SSH module installs, configures, and manages SSH.

## Module Description

The SSH module handles installing and configuring SSH across a range of operating systems and distributions.

## Setup

### What SSH affects

* Installing SSH
* /etc/ssh/sshd_config

### Basics

Getting started with this module is as simple as specifying the following in your manifest:

```puppet
class { 'ssh': }
```

If you would like to customize your /etc/sshd_config a bit, here is a brief example using 2 parameters:

```puppet
class { 'ssh': permitrootlogin => 'no', banner => '/etc/issue.net' }
```

## Usage

The following parameters are available in the ssh module:

* port
* addressfamily
* listenaddress
* protocol
* keyregenerationinterval
* serverkeybits
* syslogfacility
* loglevel
* logingracetime
* permitrootlogin
* strictmodes
* maxauthtries
* maxsessions
* rsaauthentication
* pubkeyauthentication
* authorizedkeysfile
* authorizedkeyscommand
* authorizedkeyscommandrunas
* rhostsrsaauthentication
* hostbasedauthentication
* ignoreuserknownhosts
* ignorerhosts
* permitemptypasswords
* passwordauthentication
* challengeresponseauthentication
* kerberosauthentication
* kerberosorlocalpasswd
* kerberosticketcleanup
* kerberosgetafstoken
* kerberosusekuserok
* gssapiauthentication
* gssapicleanupcredentials
* gssapistrictacceptorcheck
* gssapikeyexchange
* usepam
* allowagentforwarding
* allowtcpforwarding
* gatewayports
* x11forwarding
* x11displayoffset
* x11uselocalhost
* printmotd
* printlastlog
* tcpkeepalive
* uselogin
* useprivilegeseparation
* permituserenvironment
* compression
* clientaliveinterval
* clientalivecountmax
* showpatchlevel
* usedns
* pidfile
* maxstartups
* permittunnel
* chrootdirectory
* banner

## Limitations

This module has been built and tested against Puppet 3.0 and higher.

The module has been tested on:

* RedHat Enterprise Linux 6
* CentOS 6
* Ubuntu 12.04

Testing on other platforms has been light and cannot be guaranteed.
