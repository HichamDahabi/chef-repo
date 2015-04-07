NUMBER_OF_MINIONS = 2
BASE_IP_ADDR = "172.17.8"
ETCD_DISCOVERY = "#{BASE_IP_ADDR}.10"
MASTER_IP_ADDR = "#{BASE_IP_ADDR}.100"
MINION_IP_ADDRS = (1..NUMBER_OF_MINIONS).collect { |i| BASE_IP_ADDR + ".#{i+100}" }

Vagrant.configure("2") do |config|
	config.omnibus.chef_version = :latest
	(1..NUMBER_OF_MINIONS).each do |i|
		config.vm.define "frontend-#{i}" do |frontend|
			frontend.vm.box = "opscode-ubuntu-14.04"
			frontend.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
			frontend.vm.hostname = "frontend-#{i}"
			frontend.vm.network :private_network, ip: MINION_IP_ADDRS[i-1]
			frontend.vm.provision :shell, :inline => "sudo apt-get update -y"
			frontend.vm.provision :chef_client do |chef|
				chef.provisioning_path = "/etc/chef"
				chef.chef_server_url = "https://api.opscode.com/organizations/nanalab"
				chef.validation_key_path = ".chef/nanalab-validator.pem"
				chef.validation_client_name = "nanalab-validator"
				chef.node_name = "frontend-#{i}"
			end
		end
	end
end