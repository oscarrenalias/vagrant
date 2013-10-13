Some VM definitions for Vagrant, using my own Puppet modules for provisioning.

Getting started
===============
Some of the VMs contain submodules (and some even submodules in the submodules), but the `bootstrap`  command will take care of all that.

The bootstrap command requires Ruby and Rake to be installed.

Developing new Vagrant definitions
==================================
Use the "new" command:

```
./new my-new-vagrant-vm
```

The command will automatically configure the Vagrantfile and create the starting Puppet manifests. The VM will be available under a folder called `my-new-vagrant-vm`.
