class blitz-vizio::apache2{
    package{'apache2':
        ensure => installed
    }

    service{ "apache2":
        ensure     => running,
        enable     => true,
        hasrestart => true,
        require    => Package['apache2']
    }

    file{'vizio.crt':
            path => '/home/vagrant/vizio.crt',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/vizio.crt",
            notify  => Service['apache2'];

        'vizio.csr':
            path => '/home/vagrant/vizio.csr',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/vizio.csr",
            notify  => Service['apache2'];

        'vizio.key':
            path => '/home/vagrant/vizio.key',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/vizio.key",
            notify  => Service['apache2'];

        'apache.envvars':
            path => '/etc/apache2/envvars',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/envvars",
            owner => root,
            group => root,
            notify  => Service['apache2'],
            mode => 0644;
    }
}