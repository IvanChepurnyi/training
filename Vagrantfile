    VAGRANTFILE_API_VERSION = "2"
    BOX_NAME='training'
    HOSTNAME="#{BOX_NAME}.box"
	 USER='app'
	 GROUP='dialout'
    ALIASES=[HOSTNAME]
	 MEMORY=4072
    CPUS=4

    %w(vagrant-hostmanager vagrant-nfs_guest vagrant-auto_network).each do |plugin|
      unless Vagrant.has_plugin?(plugin)
        raise 'In order to use this box, you must install plugin: ' + plugin
      end
    end

    AutoNetwork.default_pool = '33.33.33.0/24'

    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.ssh.forward_agent = true
      config.vm.provider 'virtualbox' do |vb|
        # Clean up network interface after tests.
        vb.destroy_unused_network_interfaces = true
      end

      config.vm.box = "hypernode"
      config.vm.box_url = "http://vagrant.hypernode.com/catalog.json"

      config.vm.provision "shell", path: "vagrant/provisioning/hypernode.sh"
      config.vm.provision "shell", path: "vagrant/provisioning/nfs.sh", env: { VAGRANT_UID: Process.euid.to_s, VAGRANT_GID: Process.egid.to_s, VAGRANT_USER: USER, VAGRANT_GROUP: GROUP }
      config.vm.provision "shell", path: "vagrant/provisioning/xhprof.sh", env: { VAGRANT_USER: USER, VAGRANT_GROUP: GROUP }
	   config.vm.provision "shell", path: "vagrant/provisioning/shell.sh"

      config.vm.synced_folder '.', '/vagrant/', disabled: true

      if Vagrant.has_plugin?("vagrant-nfs_guest")
         config.vm.synced_folder 'vm', '/data/web', type: 'nfs_guest', create: true,
            linux__nfs_options: ["rw", "no_subtree_check", "all_squash", "insecure", "async"],
            map_uid: Process.euid, map_gid: Process.egid,
				owner: USER, group: GROUP
      end

      if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.include_offline = true
		  
		  config.vm.provider "virtualbox" do |v|
		      v.memory = MEMORY
				v.cpus = CPUS
		  end
		   
        config.vm.define 'hypernode' do |node|
          node.vm.hostname = HOSTNAME
          node.vm.network :private_network, auto_network: true
          node.hostmanager.aliases = ALIASES
        end
      end
    end
