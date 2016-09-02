describe ConfigurationProvider do
  example_yaml =
    %(
      hp:
        name: Haskell Pointer
        email: kyle.pointer@asynchrony.com
        key_name: kyle.pointer
      bl:
        name: Brian Lai
        email: brian.lai@asynchrony.com
        key_name: brian.lai
    )

  describe '#user_configurations' do
    it 'returns UserConfiguration objects based on the YAML contents' do
      expect(File).to receive(:expand_path)
        .with('~/.pairest.yml') { '/lul/.pairest.yml' }

      expect(File).to receive(:read)
        .with('/lul/.pairest.yml') { example_yaml }

      expect(File).to receive(:exist?) { true }

      expected_configurations = [
        UserConfiguration.new(
          initials: 'hp',
          name: 'Haskell Pointer',
          email: 'kyle.pointer@asynchrony.com',
          key: 'kyle.pointer'
        ),
        UserConfiguration.new(
          initials: 'bl',
          name: 'Brian Lai',
          email: 'brian.lai@asynchrony.com',
          key: 'brian.lai'
        )
      ]

      expect(ConfigurationProvider.user_configurations)
        .to eq expected_configurations
    end

    it 'creates an example configuration and exists if there is none already' do
      skeleton_pairest_config = "hp:\n" \
                                 "  name: Haskell Pointer\n" \
                                 "  email: kyle.pointer@asynchrony.com\n" \
                                 "  key_name: kyle.pointer\n" \
                                 "eu:\n" \
                                 "  name: Example User\n" \
                                 "  email: example.user@somewhere.com\n" \
                                 "  key_name: example.user\n"

      expect(File).to receive(:expand_path)
        .with('~/.pairest.yml') { '/lul/.pairest.yml' }

      expect(File).to receive(:exist?) { false }

      expect(File).to receive(:write)
        .with('/lul/.pairest.yml', skeleton_pairest_config)

      expect(STDOUT)
        .to receive(:puts)
        .with('Creating ~/.pairest.yml for you. Edit it before you continue')

      expect { ConfigurationProvider.user_configurations }
        .to raise_error(SystemExit)
    end
  end
end
