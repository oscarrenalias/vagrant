This vagrant VM definition will create a server with Redis 2.6.9 running in it, plus a few basic packages.

At the end of the installation process you may see a message like this:

Error: Could not enable redis_6379: Execution of '/sbin/chkconfig redis_6379 on' returned 1: service redis_6379 does not support chkconfig

Error: /Stage[main]/Redis/Redis::Instance[redis-default]/Service[redis-6379]/ensure: change from stopped to running failed: Could not enable redis_6379: Execution of '/sbin/chkconfig redis_6379 on' returned 1: service redis_6379 does not support chkconfig

This message is harmless and can be safely ignored.