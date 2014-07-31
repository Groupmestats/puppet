class camping {

    file {'/etc/default/camping-server':
	source => '/vagrant/puppet/modules/camping/files/camping-server.default',
	mode => 755,
	notify => Service['camping-server'],
    }

    file {'/etc/init.d/camping-server':
        source => '/vagrant/puppet/modules/camping/files/camping-server.init',
        mode => 755,
	notify => Service['camping-server'],
    }

    file {'/var/log/camping-server':
	ensure => 'directory',
    }

    file {'/var/log/camping-server/log':
	ensure => 'file',
	mode => 666,
	require => File['/var/log/camping-server'],
	notify => Service['camping-server']
    }

    file {'/app/groupmestats/camping/web.yaml':
	source => '/vagrant/puppet/modules/camping/files/web.yaml',
	mode => 744,
	notify => Service['camping-server'],
    }

    package { 'camping':
        ensure => present,
    }

    service { 'camping-server':
	ensure => running,
	enable => true,
	require => [ Package['camping'],
		     File['/etc/init.d/camping-server'] ],
    }
}
