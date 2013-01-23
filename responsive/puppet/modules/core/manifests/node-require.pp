class core::node-require{
    exec { "install-requirejs":
        command => "npm install -g requirejs",
        require => Package['npm'],
    }
}