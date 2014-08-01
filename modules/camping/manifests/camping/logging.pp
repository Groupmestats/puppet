# Class: camping::logging
#
#
class camping::logging {
    file { '/var/log/camping-server':
        ensure => 'directory',
    }

    file { '/etc/logrotate.d/camping-server':
        source => '/vagrant/puppet/modules/camping/files/camping-server.logrotate',
        mode   => 755,
#        notify => Service['camping-server'],
    }

    file { '/app/groupmestats/camping/web.yaml':
        source => '/vagrant/puppet/modules/camping/files/web.yaml',
        mode   => 744,
#        notify => Service['camping-server'],
    }
}
