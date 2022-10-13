Vagrant.configure("2") do |config|
  config.vm.network :private_network, type: "dhcp", subnet: "172.28.192.0/28"
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
end