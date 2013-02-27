require base
require memcache

# Allow traffic via the firewall to memcache from external hosts
firewall { "999 Memcached traffic":
  action => "accept",
  dport => $memcache::params::port,
}
