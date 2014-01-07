# params.pp

class ssh::params {

$port                            = undef 
$addressfamily                   = undef
$listenaddress                   = undef
$protocol                        = '2'
$keyregenerationinterval         = undef
$serverkeybits                   = undef
$syslogfacility                  = 'AUTHPRIV'
$loglevel                        = undef
$logingracetime                  = undef
$permitrootlogin                 = undef
$strictmodes                     = undef
$maxauthtries                    = undef
$maxsessions                     = undef
$rsaauthentication               = undef
$pubkeyauthentication            = undef
$authorizedkeysfile              = undef
$authorizedkeyscommand           = undef
$authorizedkeyscommandrunas      = undef
$rhostsrsaauthentication         = undef
$hostbasedauthentication         = undef
$ignoreuserknownhosts            = undef
$ignorerhosts                    = undef
$permitemptypasswords            = undef
$passwordauthentication          = 'yes'
$challengeresponseauthentication = 'no'
$kerberosauthentication          = undef
$kerberosorlocalpasswd           = undef
$kerberosticketcleanup           = undef
$kerberosgetafstoken             = undef
$kerberosusekuserok              = undef
$gssapiauthentication            = 'yes'
$gssapicleanupcredentials        = 'yes'
$gssapistrictacceptorcheck       = undef
$gssapikeyexchange               = undef
$usepam                          = 'yes'
$allowagentforwarding            = undef
$allowtcpforwarding              = undef
$gatewayports                    = undef
$x11forwarding                   = 'no'
$x11displayoffset                = undef
$x11uselocalhost                 = undef
$printmotd                       = undef
$printlastlog                    = undef
$tcpkeepalive                    = undef
$uselogin                        = undef
$useprivilegeseparation          = undef
$permituserenvironment           = undef
$compression                     = undef
$clientaliveinterval             = undef
$clientalivecountmax             = undef
$showpatchlevel                  = undef
$usedns                          = undef
$pidfile                         = undef
$maxstartups                     = undef
$permittunnel                    = undef
$chrootdirectory                 = undef
$banner                          = undef

  case $osfamily {
    'RedHat': {
      $package_list = ['openssh-server', 'openssh']
      $service_name = 'sshd'
      $subsystem    = '/usr/libexec/openssh/sftp-server'
    }
    'Debian': {
      $package_list = ['openssh-server', 'openssh-client']
      $service_name = 'ssh'
      case $::architecture {
        'x86_64', 'amd64': {
          $subsystem = '/usr/lib64/ssh/sftp-server'
        }
        'i386' : {
          $subsystem = '/usr/lib/ssh/sftp-server'
        }
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily: RedHat and Debian")
    }
  }
}
