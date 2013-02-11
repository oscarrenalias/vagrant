class { 'base': } ->
class { 'gcc': } ->
class { 'redis': version => '2.6.5', }

# allow traffic via the CentOS firewall to Redis
firewall { "999 Redis traffic":
  action => "accept",
  dport => $redis::params::redis_port,
}
