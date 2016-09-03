class SshConfigurator
  def self.link_current_key(name)
    verify_ssh_config_exists

    system "ln -sf ~/.ssh/#{name} ~/.ssh/current_key"
  end

  private_class_method

  def self.verify_ssh_config_exists
    full_config_path = File.expand_path('~/.ssh/config')

    unless File.exist? full_config_path
      File.write(full_config_path, skeleton_ssh_config)
      puts error_message
      raise SystemExit
    end
  end

  def self.error_message
    "Creating ~/.ssh/config for you. Edit it before you continue\n" \
    "Pairest will manage a link called current_key in ~/.ssh, so you\n" \
    "probably want to keep that part of the ssh config the same."
  end

  def self.skeleton_ssh_config
    "Host dev.example.com\n" \
    "  HostName dev.example.com\n" \
    "  User git\n" \
    "  IdentityFile ~/.ssh/current_key\n"
  end
end
