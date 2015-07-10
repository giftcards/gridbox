# Setup configuration files, gridbox folder, phantomjs binary
# selenium jar file, and init scripts
class gridbox::config {
  require(gridbox::packages)

  File {
    ensure => file,
    notify => Service[$gridbox::services]
  }

  file {
    '/local/gridbox':
      ensure => directory;
  }

  if $gridbox::phantom {
    file {
      '/etc/phantom.conf':
        content => template('gridbox/phantom.conf.erb');

      '/local/gridbox/phantomjs':
        source => 'puppet:///modules/gridbox/phantomjs',
        mode => '0755';

      '/etc/init.d/phantom':
        source => 'puppet:///modules/gridbox/phantom.initd',
        mode => '0755';
    }
  }

  if $gridbox::selenium {
    file {
      '/etc/selenium.conf':
        content => "TIMEOUT=${gridbox::timeout}";

      '/local/gridbox/selenium.jar':
        source => 'puppet:///modules/gridbox/selenium.jar';

      '/etc/init.d/selenium':
        source => 'puppet:///modules/gridbox/selenium.initd',
        mode => '0755';
    }
  }
}
