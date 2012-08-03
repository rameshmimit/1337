class blitz-vizio::configuration-vagrant {

    file{'showroom.application.ini':
            path => '/home/vagrant/projects/vizio/application/configs/application.ini',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/showroom/showroom.application.ini";

        'store.local.xml':
            path => '/home/vagrant/projects/vizio/store/app/etc/local.xml',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/store/store.local.xml";

        'store.bright.config.xml':
            path => '/home/vagrant/projects/vizio/store/app/code/local/Vizio/Bright/etc/config.xml',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/store/store.bright.config.xml";

        'ssh.pub':
            path => '/home/vagrant/.ssh/blitz_rsa.pub',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/ssh/blitz_rsa.pub";

        'ssh.priv':
            path => '/home/vagrant/.ssh/blitz_rsa',
            ensure => present,
            mode => 0600,
            source => "puppet:///modules/blitz-vizio/ssh/blitz_rsa";

        'id.pub':
            path => '/home/vagrant/.ssh/id_rsa.pub',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/ssh/id_rsa.pub";

        'id.priv':
            path => '/home/vagrant/.ssh/id_rsa',
            ensure => present,
            mode => 0600,
            source => "puppet:///modules/blitz-vizio/ssh/id_rsa";

        'store.schema.sql':
            path => '/home/vagrant/vincmagento_schema.sql',
            ensure => present,
            source => "puppet:///modules/blitz-vizio/store/vincmagento_schema.sql";
    }

    # ssh-keyscan -t rsa blitzstaging.com
    sshkey{"blitzstaging_known_host":
            ensure => present,
            type => rsa,
            name => "blitzstaging.com",
            key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA+ogNtqfhak9nlBS+RMuhfN7SVPnWpg5MXXxB8nQFmujmXIUP3cGYvS642l5R62bgFvwqRkudlFt9hhooqz+nzGyDaP1jWYVTvl9WuH7IjUam3irhb5bMoriDsw+lGmli/01wPwDorsg9Onwi+ccCK7iZ77Ea61ALwrN59U58Zh3MQ2gmjmirw/K7ANYO1Q0Qythec+ZmsJkx7qLfXsCGboQRScAmkbGHUgv4r0Aqp5AjEao6sHU6pvGWBqQ7zO2b1X6OphA+HrrLYyyA4tcnfCsQYsjIL4KCRQNKca9RIoUnnEkdkImaWGaIxMt8Vpf7iEoskE/bG+Rh8cijqM9I3w=="
    }
}