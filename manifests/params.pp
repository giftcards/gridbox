# Static defaults
class gridbox::params {
  $phantom  = true
  $workers  = 5
  $host = '127.0.0.1'
  $proxy = 'none'

  $selenium = true
  $timeout  = 60

  $packages = [ 'java-1.8.0-openjdk', 'freetype', 'fontconfig' ]
}
