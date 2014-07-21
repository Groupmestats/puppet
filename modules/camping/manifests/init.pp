class camping {

    file {'/etc/default/camping-server':
	source => '/vagrant/modules/camping/files/camping-server.default',
	mode => 755,
    }

    file {'/etc/init.d/camping-server':
        source => '/vagrant/modules/camping/files/camping-server.init',
        mode => 755,
    }

    file {'/app/groupmestats/camping/web.yaml':
	source => '/vagrant/modules/camping/files/web.yaml',
	mode => 744,
    }

    package { 'camping':
        ensure => present,
    }

    service { 'camping-server':
	ensure => running,
	enable => true,
	require => [ File['/etc/default/camping-server'],
		     File['/etc/init.d/camping-server'],
		     File['/app/groupmestats/camping/web.yaml'],
		     Package['camping'] ],
    }
}
