class profile::orchardcms (
  
) {
  include chocolatey

  package { 'powershell':
    provider => 'chocolatey',
    notify   => Reboot['Reboot-PowerShell'],
  }

  reboot { 'Reboot-PowerShell':
    apply => finished,
  }

  dsc_windowsfeature {'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
    notify     => Reboot['Reboot-CMS'],
  }

  dsc_windowsfeature {'IIS-Scripting-Tools':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Scripting-Tools',
    notify     => Reboot['Reboot-CMS'],
  }
  
  dsc_windowsfeature {'Web-Mgmt-Console':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Console',
  }
  
  package { 'orchardcms':
    ensure   => latest,
    provider => 'chocolatey',
  }
  
  iis_site { 'Default Web Site':
    ensure          => 'started',
    applicationpool => 'DefaultAppPool',
    physicalpath    => 'c:\\inetpub\\wwwroot\\orchard',
    require         => [Dsc_windowsfeature['IIS-Scripting-Tools'],
                        Dsc_windowsfeature['IIS'],
                        Package['orchardcms']],
  }

  iis_site { 'minimal':
    ensure => absent,
  }
  
  reboot { 'Reboot-CMS':
    apply => finished,
  }
  
}