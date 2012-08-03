class blitz-vizio::apache2-vhosts {

    file{'vizio.vhost':
            path => '/etc/apache2/sites-available/vizio',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/vizio.vhost",
            owner => root,
            group => root;

         'vizio-store.vhost':
            path => '/etc/apache2/sites-available/vizio-store',
            ensure => present,
            require => Package[apache2],
            source => "puppet:///modules/blitz-vizio/apache2/vizio-store.vhost",
            owner => root,
            group => root;
    }

    file{'/etc/apache2/sites-enabled/000-vizio':
            ensure => link,
            target => '/etc/apache2/sites-available/vizio',
            require => [Package['apache2'], File['vizio.vhost']],
            notify  => Service['apache2'],
            owner => root,
            group => root;

         '/etc/apache2/sites-enabled/000-vizio-store':
            ensure => link,
            target => '/etc/apache2/sites-available/vizio-store',
            require => [Package['apache2'], File['vizio-store.vhost']],
            notify  => Service['apache2'],
            owner => root,
            group => root;
    }
}