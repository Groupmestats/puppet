# Class: camping::install
#
#
class camping::install {
    package { 'camping':
        ensure => present,
    }
}
