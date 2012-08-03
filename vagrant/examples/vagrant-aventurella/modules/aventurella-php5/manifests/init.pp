# == Class: php5
#
# Full description of class php5 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { php5:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class aventurella-php5 {

    $phpPackageList = [
        "php5",
        "php5-mysql",
        "php5-mysqlnd",
        "php5-gd",
        "php5-curl",
        "php5-xdebug",
        "php-pear",
        "php5-xmlrpc",
        "libapache2-mod-php5",
        "phpunit"]

    package { $phpPackageList:
        require => [Package['apache2'], Package['mysql-server']]
    }
}

