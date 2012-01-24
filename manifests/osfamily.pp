# Class: stdlib::osfamily
#
# This class providers support of osfamily regardless of facter version.
#
# The osfamily value is provided for facter < 1.6.2
#
# Parameters: none
#
# Actions:
#
# Requires: nothing
#
# Sample Usage:
#
#  node default {
#    include stdlib
#  }
#
class osfamily {

  # Evil hack to provide osfamily, order dependent so stdlib must be included
  # first.
  if versioncmp('1.6.2', $::facterversion) > 0 {
    case $::operatingsystem {
      'RedHat', 'Fedora', 'CentOS', 'Scientific', 'SLC', 'Ascendos', 'CloudLinux', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
        $::osfamily += 'RedHat'
      }
      'Ubuntu', 'Debian': {
        $::osfamily += 'Debian'
      }
      'SLES', 'SLED', 'OpenSuSE', 'SuSE': {
        $::osfamily += 'Suse'
      }
      'Solaris', 'Nexenta': {
        $::osfamily += 'Solaris'
      }
    }
  }

}
