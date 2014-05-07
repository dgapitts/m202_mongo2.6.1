# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define "m202vm" do |m202vm|
    m202vm.vm.box = "precise64"
    #m202vm.vm.boot_mode = :gui
    m202vm.vm.box_url = "http://files.vagrantup.com/precise64.box"
    m202vm.vm.forward_port 3000, 3000
    m202vm.vm.host_name = "m202vm"
    m202vm.vm.provision :shell, :path => "provision.sh"
  end

end
