node default {
    Exec { path => "/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin"}

    # ensures proper ordering of provisioning
    stage { first: before => Stage[main] }
    stage { last: require => Stage[main] }

    # add includes here
    include site::init
    include core::apache2
    include core::python
    include core::python-fabric
    include core::ruby
    include core::gem-sass
    include core::vim
}