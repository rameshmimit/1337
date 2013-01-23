class core::python-fabric{
    exec { "sudo /usr/bin/pip install fabric":
        require => [Package['python-pip'], Package['python-dev'], Package['python2.7']],
        unless => 'pip freeze | grep Fabric'
    }
}