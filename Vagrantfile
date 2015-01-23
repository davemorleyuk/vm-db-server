# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "mobileoverlord/centos-6.5"
  config.vm.hostname = "atlas"
  config.vm.network :public_network, ip: "192.168.100.35", bridge: 'em1'

config.persistent_storage.enabled = true
config.persistent_storage.location = "/home/vms/atlas/hdd.vdi.bak"
config.persistent_storage.size = 50000
config.persistent_storage.mountname = 'mysql'
config.persistent_storage.filesystem = 'ext4'
config.persistent_storage.mountpoint = '/var/lib/mysql'
config.persistent_storage.volgroupname = 'myvolgroup'
	
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "6144"]

#    file_to_disk = File.realpath( "." ).to_s + "/disk.vdi"
#    if ARGV[0] == "up" && ! File.exist?(file_to_disk)
#      puts "Creating 100GB disk #{file_to_disk}."
#      vb.customize [
#        'createhd',
#        '--filename', file_to_disk,
#        '--format', 'VDI',
#        '--size', 1000000 * 1024 # 100 GB
#      ]
#      vb.customize [
#        'storageattach', :id,
#        '--storagectl', 'SATA',
#        '--port', 1, '--device', 0,
#        '--type', 'hdd', '--medium',
#        file_to_disk
#      ]
#    end
  end	
  
#  config.vm.synced_folder "../../PROJECTS/is3/app", "/home/vagrant/app"
#  config.vm.synced_folder "../../PROJECTS/is3/mysql_scripts", "/home/vagrant/mysql_scripts"

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = "./chef/roles"
    chef.cookbooks_path = ["./chef/site-cookbooks", "./chef/cookbooks"]
    chef.add_role "vagrant-test-box"
  end

end
