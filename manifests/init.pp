# The gridbox class installs Selenium Hub and phantomjs.
# It starts the selenium java process in hub mode and then points
# multiple phantomjs workers at it
#
# $phantom = [ bool, True ] Whether or not to install phantomjs
# $workers = [ int, 5 ] How many phantomjs workers to start
# $host = [ str, 127.0.0.1 ] Selenium host to point the workers at
# $proxy = [ str, none ] http proxy:port for the phantom workers
# $selenium = [ bool, True ] Whether or not to install selenium
# $timeout = [ int, 60 ] How many seconds to set the selenium
#                        timeout and browserTimeout options to
class gridbox (

  $phantom = $gridbox::params::phantom,
  $workers = $gridbox::params::workers,
  $host = $gridbox::params::host,
  $proxy = $gridbox::params::proxy,

  $selenium = $gridbox::params::selenium,
  $timeout = $gridbox::params::timeout,

) inherits gridbox::params {

  $packages = $gridbox::params::packages

  if $phantom and $selenium {
    $services = [ 'phantom', 'selenium' ]
  } elsif $phantom {
    $services = [ 'phantom' ]
  } elsif $selenium {
    $services = [ 'selenium' ]
  } else {
    fail('No services enabled!')
  }

  include gridbox::packages
  include gridbox::config
  include gridbox::services
}
