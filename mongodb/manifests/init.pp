class { "base": } ->
class { "dotfiles::vagrant": } ->
class { "mongodb": }

#
# 27017
# This is the default port mongod and mongos instances. You can change this port with port or --port.
# 27018
# This is the default port when running with --shardsvr runtime operation or shardsvr setting.
# 27019
# This is the default port when running with --configsvr runtime operation or configsvr setting.
# 28017
# This is the default port for the web status page. This is always accessible at a port that is 1000 greater than the port determined by port.
#
firewall { "999-mongo-27017":
  action => "accept",
  dport => 27017,
}

firewall { "999-mongo-27018":
  action => "accept",
  dport => 27018,
}

firewall { "999-mongo-27019":
  action => "accept",
  dport => 27019,
}

firewall { "999-mongo-28017":
  action => "accept",
  dport => 28017,
}
