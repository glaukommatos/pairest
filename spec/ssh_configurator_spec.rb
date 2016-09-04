describe SshConfigurator do
  describe '.set_current_key' do
    it 'will relink the key' do
      expect(File).to receive(:expand_path)
        .with('~/.ssh/config') { '/lul/.ssh/config' }
      expect(File).to receive(:exist?)
        .with('/lul/.ssh/config') { true }

      expect(File).to receive(:expand_path)
        .with('~/.ssh/blah') { '/lul/.ssh/blah' }
      expect(File).to receive(:expand_path)
        .with('~/.ssh/current_key') { '/lul/.ssh/current_key' }

      expect(FileUtils).to receive(:ln_sf)
        .with('/lul/.ssh/blah', '/lul/.ssh/current_key')

      SshConfigurator.link_current_key('blah')
    end

    it 'creates an example configuration and exits if there is none already' do
      skeleton_ssh_config = "Host dev.example.com\n" \
                            "  HostName dev.example.com\n" \
                            "  User git\n" \
                            "  IdentityFile ~/.ssh/current_key\n"

      error_message = "Creating ~/.ssh/config for you.\n" \
                      "Please edit it before you continue.\n" \
                      "Pairest will manage a symbolic link called\n" \
                      "current_key in ~/.ssh, so you probably want to\n" \
                      "keep that part of the ssh config the same.\n"

      expect(File).to receive(:expand_path)
        .with('~/.ssh/config') { '/lul/.ssh/config' }

      expect(File).to receive(:exist?) { false }

      expect(File).to receive(:write)
        .with('/lul/.ssh/config', skeleton_ssh_config)

      expect(STDOUT)
        .to receive(:puts)
        .with(error_message)

      expect { SshConfigurator.link_current_key('blah') }
        .to raise_error(SystemExit)
    end
  end
end
