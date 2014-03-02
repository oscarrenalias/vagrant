echo Downloading Go server and agent...
cd /tmp && curl -O http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.noarch.rpm
cd /tmp && curl -O http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.noarch.rpm

echo Downloading additional tools...
cd /tmp && curl -O http://mirror.netinch.com/pub/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz

echo Installing dependencies and packages...
yum install -y java-1.7.0-openjdk-devel git-core
rpm -i /tmp/go-server-13.4.1-18342.noarch.rpm /tmp/go-agent-13.4.1-18342.noarch.rpm

echo Installing additonal tools...
tar zxvf /tmp/apache-maven-3.2.1-bin.tar.gz -C /opt
ln -s /opt/apache-maven-3.2.1/ /opt/maven

echo Setting up services...
/etc/init.d/go-agent start
/sbin/chkconfig --add go-agent
/sbin/chkconfig --add go-service
/sbin/chkconfig go-agent on
/sbin/chkconfig go-service on

# stop iptables since we don't need a firewall
service iptables stop