class { "base": } ->
class { "java":
  type => "jdk",
  version => "1.7.0",
} ->
class { "jenkins_node": }

# allow traffic via the CentOS firewall to Jenkins
firewall { "999 Jenkins traffic":
  action => "accept",
  dport => "8080",
}
