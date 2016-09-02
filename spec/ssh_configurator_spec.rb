describe SshConfigurator do
  describe '.set_current_key' do
    it 'will relink the key' do
      expect(SshConfigurator).to receive(:system)
        .with('ln -sf ~/.ssh/blah ~/.ssh/current_key')

      SshConfigurator.link_current_key('blah')
    end
  end
end
