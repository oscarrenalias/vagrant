class { "base": } ->
class { "wget": } ->
class { "java":
  type => "jdk",
  install_maven => true,
} ->
class { "jenkins_node": }

# allow traffic via the CentOS firewall to Jenkins
firewall { "999 Jenkins traffic":
  action => "accept",
  dport => "8080",
}
