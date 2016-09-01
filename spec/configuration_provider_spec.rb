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

  describe '#get' do
    it 'parses the config file and returns something reasonable' do
      test_object = ConfigurationProvider.new

      expect(File).to receive(:read).with('~/.pairest.yml') { example_yaml }

      expected_hash =
        {
          'hp' =>
          {
            'name' => 'Haskell Pointer',
            'email' => 'kyle.pointer@asynchrony.com',
            'key_name' => 'kyle.pointer'
          },
          'bl' =>
          {
            'name' => 'Brian Lai',
            'email' => 'brian.lai@asynchrony.com',
            'key_name' => 'brian.lai'
          }
        }

      expect(test_object.get).to eq expected_hash
    end
  end
end
