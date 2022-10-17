Vagrant.configure("2") do |config|
  config.vm.network "public_network", bridge: "Intel(R) Wi-Fi 6 AX200 160MHz"
  config.vm.box = "hashicorp/bionic64"
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
end