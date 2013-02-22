Some VM definitions for Vagrant.

Some of the VMs contain submodules (and some even submodules in the submodules), make sure to run the following commands in case of missing content:

git submodule init
git submodule update

Then, run the same in each one of the templates to intialize the submodules within the submodules (the parent repository at https://github.com/oscarrenalias/puppet has submodules of its own)

Alternativel, run the "bootstrap" rake task to do it all automatically (or use the boostrap script), but rake must be available in the system for it to work.
