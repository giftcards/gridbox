# Install our enable and start our services, depending on what's enabled
class gridbox::services {
  require(gridbox::config)
  require(gridbox::packages)

  service { $gridbox::services:
    ensure => running,
    enable => true,
  }
}
