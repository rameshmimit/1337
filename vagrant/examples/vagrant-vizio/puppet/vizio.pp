node default{
    Exec { path => "/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:/usr/local/sbin" }
    
    stage { first: before => Stage[main] }
    stage { last: require => Stage[main] }
    
    include blitz-vizio
    include blitz-vizio::apache2
    include blitz-vizio::apache2-modules
    include blitz-vizio::apache2-vhosts
    include blitz-vizio::python
    include blitz-vizio::ruby
    include blitz-vizio::vim
    include blitz-vizio::php5
    include blitz-vizio::git
    include blitz-vizio::mysql5
    include blitz-vizio::configuration-vagrant
}