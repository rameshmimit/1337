class core::gem-sass{
    package { "sass":
        provider => "gem",
        ensure => installed,
        require => Package['rubygems'],
    }
}