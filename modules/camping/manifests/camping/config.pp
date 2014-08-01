# Class: camping::config
#
#
class camping::config {
    file { '/etc/default/camping-server':
        source => '/vagrant/puppet/modules/camping/files/camping-server.default',
        mode   => 755,
#        notify => Service['camping-server'],
    }

    file { '/etc/init.d/camping-server':
        source => '/vagrant/puppet/modules/camping/files/camping-server.init',
        mode   => 755,
#        notify => Service['camping-server'],
    }
}
