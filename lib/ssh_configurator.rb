class SshConfigurator
  def self.link_current_key(name)
    system "ln -sf ~/.ssh/#{name} ~/.ssh/current_key"
  end
end
