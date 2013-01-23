class core::yeoman{
	include core::ruby
	include core::git
	include core::optipng
	include core::jpegtran
	include core::node
	include core::curl
	include core::phantomjs
	include core::compass
	include core::phantomjs

    # install yeoman
    # do check to avoid asking npm to install this once its installed
    exec { "install yeoman":
        command => "npm install -g yeoman",
        require => Package['npm'],
    }
}