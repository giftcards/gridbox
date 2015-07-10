# Install the packages from gridbox::packages
class gridbox::packages {
  package { $gridbox::packages:
    ensure => installed,
    notify => Service[$gridbox::services],
  }
}
