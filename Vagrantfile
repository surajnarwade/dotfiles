# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  
  config.vm.define "c1" do |c1|
    c1.vm.hostname = "c1"
    c1.vm.network "private_network", ip: "192.168.50.10"
  end

  config.vm.define "c2" do |c2|
    c2.vm.hostname = "c2"
    c2.vm.network "private_network", ip: "192.168.50.11"
  end

  config.vm.define "w1" do |w1|
    w1.vm.hostname = "w1"
    w1.vm.network "private_network", ip: "192.168.50.20"
  end

  config.vm.define "w2" do |w2|
    w2.vm.hostname = "w2"
    w2.vm.network "private_network", ip: "192.168.50.21"
  end

  config.vm.provider "virtualbox" do |virtualbox, override|
    virtualbox.memory = 2048
    virtualbox.cpus = 2
  end

end
