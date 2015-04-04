Sample Chef Repository
======================

Sample chef repository to show minimum use case for chef cookbooks.

Usage
-----

Get chef cookbooks.

```
$ berks vendor cookbooks
```

Make node's JSON file.

```
$ vi ./nodes/my_node.json
```

Make virtual machine with Vagrant, and ssh.

```
$ vagrant box add tkak/centos-6.6-x86_64-chef-dk
$ vagrant init tkak/centos-6.6-x86_64-chef-dk
$ vagrant up
$ vagrant ssh
```

Run chef-client.

```
$ sudo chef-client -z -j /vagrant/nodes/my_node.json -c /vagrant/conf/client.rb
```
