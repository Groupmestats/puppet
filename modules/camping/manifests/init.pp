# Class: camping
# Module for setting up the Groupmestats camping server
#
#
class camping {

    class{'camping::config': } ->
    class{'camping::logging': } ->
    class{'camping::install': } ->
    class{'camping::service': } ->
    Class['camping']
}
