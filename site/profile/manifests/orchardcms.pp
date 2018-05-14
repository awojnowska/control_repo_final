class profile::orchardcms (
  String $windowsisosource,
) {
  include chocolatey

  package { 'dotnet4.5':
      ensure   => latest,
      provider => 'chocolatey',
    }
    -> package { 'powershell':
      ensure   => installed,
      provider => 'chocolatey',
    }
    ~> reboot { 'reboot_powershell':
      when    => refreshed,
      timeout => 15,
    }

  package { 'dotnetcore-runtime':
    ensure   => installed,
    provider => 'chocolatey',
    notify   => Reboot['reboot_mymatters_iis'],
    require  => Dsc_windowsfeature['IIS Management - Console'],
  }

  package { 'dotnetcore':
    ensure   => installed,
    provider => 'chocolatey',
    notify   => Reboot['reboot_mymatters_iis'],
    require  => Dsc_windowsfeature['IIS Management - Console'],
  }

  dsc_windowsfeature { 'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
    require    => Package['powershell'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Application-server':
    dsc_ensure => 'present',
    dsc_name   => 'AS-NET-Framework',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Storage Services':
    dsc_ensure => 'present',
    dsc_name   => 'Storage-Services',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Default Document':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Default-Doc',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Directory Browsing':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Dir-Browsing',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Web Http Errors':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Http-Errors',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Web Static Content':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Static-Content',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Web Http Logging':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Http-Logging',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Static Content Compression':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Stat-Compression',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'IIS - Windows Authentication':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Windows-Auth',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Request Filtering':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Filtering',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Windows Authentication':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Windows-Auth',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'ASP.NET 4.5':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Net-Ext45',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'ISAPI Extensions':
    dsc_ensure => 'present',
    dsc_name   => 'Web-ISAPI-Ext',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'ISAPI Filters':
    dsc_ensure => 'present',
    dsc_name   => 'Web-ISAPI-Filter',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Websocket Protocol':
    dsc_ensure => 'present',
    dsc_name   => 'Web-WebSockets',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { '.NET Framework 4.5 Features':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-45-Features',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Remote Differential Compression':
    dsc_ensure => 'present',
    dsc_name   => 'RDC',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'WoW64 Support':
    dsc_ensure => 'present',
    dsc_name   => 'WoW64-Support',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'NET Framework 4.5':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Asp-Net45',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Configuration APIs':
    dsc_ensure => 'present',
    dsc_name   => 'WAS-Config-APIs',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'WCF Services':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-Services45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'HTTP Activation':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-HTTP-Activation45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Nessage Queuing (MSMQ)  Activation':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-MSMQ-Activation45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'Named Pipe Activation':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-Pipe-Activation45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'TCP Activation':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-TCP-Activation45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  dsc_windowsfeature { 'IIS Management - Console':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Console',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_mymatters_iis'],
  }

  reboot { 'reboot_mymatters_iis':
    when    => refreshed,
    timeout => 15,
  }
  
  package { '7zip':
    ensure   => latest,
    provider => 'chocolatey',
  }
  
  archive { :
    path          => "C:\\Windows\\Temp\\orchard.zip",
    source        => 'https://github-production-release-asset-2e65be.s3.amazonaws.com/33889464/c54c936c-2b43-11e7-912b-f0ea7a8433fd?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180514%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180514T141219Z&X-Amz-Expires=300&X-Amz-Signature=8a910cf2749691092de8529d31563ed49dafef4fe3f154f179c9e63bf17c0f64&X-Amz-SignedHeaders=host&actor_id=1743782&response-content-disposition=attachment%3B%20filename%3DOrchard.Web.1.10.2.zip&response-content-type=application%2Foctet-stream',
    extract       => true,
    extract_path  => 'c:\\inetpub\\wwwroot',
    creates       => "${install_path}/bin",
    cleanup       => true,
    user          => 'tomcat',
    group         => 'tomcat',
    require       => File[$install_path],
  }
  
  iis_application_pool { '.NET v4.5':
    ensure                             => 'present',
    auto_start                         => 'true',
    cpu_action                         => 'NoAction',
    cpu_reset_interval                 => '00:05:00',
    cpu_smp_affinitized                => 'false',
    cpu_smp_processor_affinity_mask    => '4294967295',
    cpu_smp_processor_affinity_mask2   => '4294967295',
    disallow_overlapping_rotation      => 'false',
    disallow_rotation_on_config_change => 'false',
    enable32_bit_app_on_win64          => 'false',
    enable_configuration_override      => 'true',
    identity_type                      => 'ApplicationPoolIdentity',
    idle_timeout                       => '00:20:00',
    idle_timeout_action                => 'Terminate',
    load_balancer_capabilities         => 'HttpLevel',
    load_user_profile                  => 'false',
    log_event_on_process_model         => 'IdleTimeout',
    log_event_on_recycle               => 'Time,Memory,PrivateMemory',
    logon_type                         => 'LogonBatch',
    managed_pipeline_mode              => 'Integrated',
    managed_runtime_version            => 'v4.0',
    manual_group_membership            => 'false',
    max_processes                      => '1',
    orphan_worker_process              => 'false',
    pass_anonymous_token               => 'true',
    ping_interval                      => '00:00:30',
    ping_response_time                 => '00:01:30',
    pinging_enabled                    => 'true',
    queue_length                       => '1000',
    rapid_fail_protection              => 'true',
    rapid_fail_protection_interval     => '00:05:00',
    rapid_fail_protection_max_crashes  => '5',
    set_profile_environment            => 'true',
    shutdown_time_limit                => '00:01:30',
    start_mode                         => 'OnDemand',
    startup_time_limit                 => '00:01:30',
    state                              => 'started',
  }

  iis_application_pool { 'Net Core':
    ensure                             => 'present',
    auto_start                         => 'true',
    cpu_action                         => 'NoAction',
    cpu_reset_interval                 => '00:05:00',
    cpu_smp_affinitized                => 'false',
    cpu_smp_processor_affinity_mask    => '4294967295',
    cpu_smp_processor_affinity_mask2   => '4294967295',
    disallow_overlapping_rotation      => 'false',
    disallow_rotation_on_config_change => 'false',
    enable32_bit_app_on_win64          => 'false',
    enable_configuration_override      => 'true',
    identity_type                      => 'SpecificUser',
    idle_timeout                       => '00:20:00',
    idle_timeout_action                => 'Terminate',
    load_balancer_capabilities         => 'HttpLevel',
    load_user_profile                  => 'false',
    log_event_on_process_model         => 'IdleTimeout',
    log_event_on_recycle               => 'Time,Memory,PrivateMemory',
    logon_type                         => 'LogonBatch',
    managed_pipeline_mode              => 'Integrated',
    manual_group_membership            => 'false',
    max_processes                      => '1',
    orphan_worker_process              => 'false',
    pass_anonymous_token               => 'true',
    password                           => '[Pqe2MNeLYY@7LR[',
    ping_interval                      => '00:00:30',
    ping_response_time                 => '00:01:30',
    pinging_enabled                    => 'true',
    queue_length                       => '1000',
    rapid_fail_protection              => 'true',
    rapid_fail_protection_interval     => '00:05:00',
    rapid_fail_protection_max_crashes  => '5',
    set_profile_environment            => 'true',
    shutdown_time_limit                => '00:01:30',
    start_mode                         => 'OnDemand',
    startup_time_limit                 => '00:01:30',
    state                              => 'started',
    user_name                          => 'FRESHFIELDS\FCL-SA-MYMAT-DEV-01',
  }

  iis_site { 'Default Web Site':
    ensure               => 'started',
    applicationpool      => 'Net Core',
    physicalpath         => 'c:\\inetpub\\wwwroot\\Orchard',
    authenticationinfo   => {
    'basic'                       => false,
    'anonymous'                   => false,
    'windows'                     => true,
    'iisClientCertificateMapping' => false,
    'digest'                      => false,
    'clientCertificateMapping'    => false
    },
    bindings             => [
    {
      'protocol'           => 'http',
      'bindinginformation' => '*:80:'
    }],
    enabledprotocols     => 'http',
    limits               => {
      'maxconnections'    => 4294967295,
      'connectiontimeout' => 120,
      'maxbandwidth'      => 4294967295
    },
    logflags             => ['ClientIP', 'Date', 'HttpStatus', 'HttpSubStatus',
                            'Method', 'Referer', 'ServerIP', 'ServerPort', 'Time', 'TimeTaken', 'UriQuery',
                            'UriStem', 'UserAgent', 'UserName', 'Win32Status'],
    logformat            => 'W3C',
    loglocaltimerollover => 'false',
    logpath              => 'C:\inetpub\logs\LogFiles',
    logperiod            => 'Daily',
    physicalpath         => 'C:\inetpub\wwwroot',
    preloadenabled       => 'false',
  }

  iis_site { 'minimal':
    ensure => absent,
  }
  
  reboot { 'Reboot-CMS':
    apply => finished,
  }
  
}