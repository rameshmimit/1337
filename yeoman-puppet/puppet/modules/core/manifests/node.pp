# node install
# todo: find way to prevent exec{"install node deps"} fron running over and over

class core::node{
	$packageList = [
		'python-software-properties'
	]

	package { $packageList: }

	exec { "install node deps":
		command => "/usr/bin/add-apt-repository ppa:chris-lea/node.js && apt-get update",
	}
	package { "nodejs":
		ensure => installed,
		require => Exec['install node deps'],
	}
	package { "npm":
		ensure => installed,
		require => Exec['install node deps'],
	}
	exec { "install yeoman":
		command => "/usr/bin/npm install -g yeoman",
		require => Package['npm'],
	}
}