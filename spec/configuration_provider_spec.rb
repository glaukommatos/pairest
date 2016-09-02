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
  end
end
