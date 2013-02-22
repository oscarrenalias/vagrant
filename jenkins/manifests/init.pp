class { "base": } ->
class { "java":
  type => "jdk",
  version => "1.7.0",
} ->
class { "jenkins": }
