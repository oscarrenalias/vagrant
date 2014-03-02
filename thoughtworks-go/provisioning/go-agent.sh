#
# This provioning script can be used to set up additional Go agents, though it is not currently used
# by the existing Vagrant file
#
echo Downloading Go server and agent...
cd /tmp && curl -O http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm

# dependencies
yum install -y java-1.7.0-openjdk-devel

# install the packages
rpm -i /tmp/go-agent-13.4.1-18342.noarch.rpm

# set up GO_SERVER in /etc/defaults/go-agent
# TODO! #

# start the services and make sure that they auto-start
/etc/init.d/go-agent start
/sbin/chkconfig --add go-agent
/sbin/chkconfig go-agent on

# stop iptables since we don't need a firewall
service iptables stop
