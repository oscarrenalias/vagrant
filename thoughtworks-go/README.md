This is a Vagrant VM for ThoughtWorks Go.

Run ```vagrant up``` to start the VM. The VM is based on my own CentOS 6.4 image, which is pulled from my personal Dropbox user folder. 

There may be some errors (XML format errors, agent unable to connect) but those seem to be related to the fact that the agent tries to connect to the server before it's ready, and they seem to be harmless so they can be ignored.

The configuration of the VM inclues a Go server, an agent so that it can run jobs, Git as well as Maven so that it's ready to go to build Java projects.

When ready, the VM and Go server can be reached at http://192.168.33.99:8153/. Go will request a first pipeline, job, etc, to be created but please consult the Go documentation for more information: http://www.thoughtworks.com/products/docs/go/current/help/
