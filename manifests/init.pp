# init.pp

class ssh (
  $package_list                    = $ssh::params::package_list,
  $service_name                    = $ssh::params::service_name,
  $port                            = $ssh::params::port,
  $addressfamily                   = $ssh::params::addressfamily,
  $listenaddress                   = $ssh::params::listenaddress,
  $protocol                        = $ssh::params::protocol,
  $keyregenerationinterval         = $ssh::params::keyregenerationinterval,
  $serverkeybits                   = $ssh::params::serverkeybits,
  $syslogfacility                  = $ssh::params::syslogfacility,
  $loglevel                        = $ssh::params::loglevel,
  $logingracetime                  = $ssh::params::logingracetime,
  $permitrootlogin                 = $ssh::params::permitrootlogin,
  $strictmodes                     = $ssh::params::strictmodes,
  $maxauthtries                    = $ssh::params::maxauthtries,
  $maxsessions                     = $ssh::params::maxsessions,
  $rsaauthentication               = $ssh::params::rsaauthentication,
  $pubkeyauthentication            = $ssh::params::pubkeyauthentication,
  $authorizedkeysfile              = $ssh::params::authorizedkeysfile,
  $authorizedkeyscommand           = $ssh::params::authorizedkeyscommand,
  $authorizedkeyscommandrunas      = $ssh::params::authorizedkeyscommandrunas,
  $rhostsrsaauthentication         = $ssh::params::rhostsrsaauthentication,
  $hostbasedauthentication         = $ssh::params::hostbasedauthentication,
  $ignoreuserknownhosts            = $ssh::params::ignoreuserknownhosts,
  $ignorerhosts                    = $ssh::params::ignorerhosts,
  $permitemptypasswords            = $ssh::params::permitemptypasswords,
  $passwordauthentication          = $ssh::params::passwordauthentication,
  $challengeresponseauthentication = $ssh::params::challengeresponseauthentication,
  $kerberosauthentication          = $ssh::params::kerberosauthentication,
  $kerberosorlocalpasswd           = $ssh::params::kerberosorlocalpasswd,
  $kerberosticketcleanup           = $ssh::params::kerberosticketcleanup,
  $kerberosgetafstoken             = $ssh::params::kerberosgetafstoken,
  $kerberosusekuserok              = $ssh::params::kerberosusekuserok,
  $gssapiauthentication            = $ssh::params::gssapiauthentication,
  $gssapicleanupcredentials        = $ssh::params::gssapicleanupcredentials,
  $gssapistrictacceptorcheck       = $ssh::params::gssapistrictacceptorcheck,
  $gssapikeyexchange               = $ssh::params::gssapikeyexchange,
  $usepam                          = $ssh::params::usepam,
  $allowagentforwarding            = $ssh::params::allowagentforwarding,
  $allowtcpforwarding              = $ssh::params::allowtcpforwarding,
  $gatewayports                    = $ssh::params::gatewayports,
  $x11forwarding                   = $ssh::params::x11forwarding,
  $x11displayoffset                = $ssh::params::x11displayoffset,
  $x11uselocalhost                 = $ssh::params::x11uselocalhost,
  $printmotd                       = $ssh::params::printmotd,
  $printlastlog                    = $ssh::params::printlastlog,
  $tcpkeepalive                    = $ssh::params::tcpkeepalive,
  $uselogin                        = $ssh::params::uselogin,
  $useprivilegeseparation          = $ssh::params::useprivilegeseparation,
  $permituserenvironment           = $ssh::params::permituserenvironment,
  $compression                     = $ssh::params::compression,
  $clientaliveinterval             = $ssh::params::clientaliveinterval,
  $clientalivecountmax             = $ssh::params::clientalivecountmax,
  $showpatchlevel                  = $ssh::params::showpatchlevel,
  $usedns                          = $ssh::params::usedns,
  $pidfile                         = $ssh::params::pidfile,
  $maxstartups                     = $ssh::params::maxstartups,
  $permittunnel                    = $ssh::params::permittunnel,
  $chrootdirectory                 = $ssh::params::chrootdirectory,
  $banner                          = $ssh::params::banner,
) inherits ssh::params {

  package {
    $package_list: ensure => installed;
  }

  file { '/etc/ssh/sshd_config':
    content => template("ssh/sshd_config.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '600',
    notify  => Service [$service_name],  # Will restart service after change
  }

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
