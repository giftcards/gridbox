class gridbox::users {
  user { 'selenium':
    ensure => present,
    home   => '/local/phantom',
    shell  => '/sbin/nologin',
  }

  user { 'phantom':
    ensure => present,
    home   => '/local/phantom',
    shell  => '/sbin/nologin',
  }
}
