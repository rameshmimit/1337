class site::apt-get {
    exec{'apt-get update':
            command => "/usr/bin/apt-get update"
    }
}