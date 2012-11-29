# node install
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
# sudo apt-get install python-software-properties
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get install nodejs npm

class site::node-packages{
    exec { "install typescript":
      command => "/usr/bin/npm install -g typescript",
      require => Package['npm'],
    }
}