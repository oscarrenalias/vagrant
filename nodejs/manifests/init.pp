require base
require dotfiles::vagrant
require nodejs

firewall { "999-node-default-port":
  dport => $nodejs::params::default_port,
  action => "accept",
}
