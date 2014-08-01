# Class: sqlite
# Module for setting up the sqlite3 database
#
#
class sqlite {
    file { '/etc/groupme.db':
        ensure => 'present',
        mode   => 755,
    }

    package { 'sqlite3':
        ensure => present,
    }
}
