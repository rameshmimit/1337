class site::apache-vhosts{
    # configure any vhost-files you need to load here
    # example
    # 
    file{'ts.vhost':
            path => '/etc/apache2/sites-available/ts',
            ensure => present,
            require => Package['apache2'],
            source => "puppet:///modules/site/apache2/ts.vhost",
            owner => root,
            group => root;
    }

    file{'/etc/apache2/sites-enabled/000-ts':
            ensure => link,
            target => '/etc/apache2/sites-available/ts',
            require => [Package['apache2'], File['ts.vhost']],
            notify  => Service['apache2'],
            owner => root,
            group => root;
    }
}