require base
require wget
class { "java":
  install_maven => true,
}
