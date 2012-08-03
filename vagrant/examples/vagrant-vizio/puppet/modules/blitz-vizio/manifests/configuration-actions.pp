class blitz-vizio::configuration-actions {

    exec{'fab css.update':
            cwd => "/home/vagrant/projects/vizio",
            user => vagrant,
            group => vagrant
    }
    
    exec{'create-showroom-db':
        command => 'mysql -u root -e "create database vincshowroom;"',
        unless => "mysql -u root vincshowroom"
    }

    exec{'create-store-db':
        command => 'mysql -u root -e "create database vincmagento;"',
        unless => "mysql -u root vincmagento"
    }

    exec{'import-store-schema':
        command => "mysql -u root vincmagento < vincmagento_schema.sql",
        require => Exec['create-store-db'],
        cwd => "/home/vagrant",
        unless => "mysql -u root vincmagento -e 'describe core_config_data'"
    }

   #exec{'/usr/local/bin/fab -i /home/vagrant/.ssh/blitz_rsa blitz.sync_db':
   #         cwd => "/home/vagrant/projects/vizio",
   #         user => vagrant,
   #         group => vagrant
   #}

   file{'.profile':
          path => '/home/vagrant/.profile',
          ensure => present,
          source => "puppet:///modules/blitz-vizio/shell/profile.sh";

          'ssh-agent.sh':
          path => '/home/vagrant/ssh-agent.sh',
          ensure => present,
          source => "puppet:///modules/blitz-vizio/shell/ssh-agent.sh";
    }
}