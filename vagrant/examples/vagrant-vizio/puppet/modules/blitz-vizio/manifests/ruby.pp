class blitz-vizio::ruby {

    $packageList = [
        "ruby",
        "rubygems"
        ]

    package { $packageList: }

    package{ 'sass':
        provider => "gem",
        ensure => installed,
        require => Package['rubygems'],
    }
}