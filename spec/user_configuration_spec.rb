describe UserConfiguration do
  describe '#initialize' do
    it 'requires a name' do
      expect do
        UserConfiguration.new(
          name: nil,
          email: 'test',
          key: 'test',
          initials: 'hp'
        )
      end.to raise_error 'User Information Missing'
    end

    it 'requires an email' do
      expect do
        UserConfiguration.new(
          name: 'Haskell Pointer',
          email: '',
          key: 'test',
          initials: 'hp'
        )
      end.to raise_error 'User Information Missing'
    end

    it 'requires a key' do
      expect do
        UserConfiguration.new(
          name: 'Haskell Pointer',
          email: 'test',
          key: '',
          initials: 'hp'
        )
      end.to raise_error 'User Information Missing'
    end

    it 'requires initials' do
      expect do
        UserConfiguration.new(
          name: 'Haskell Pointer',
          email: 'test',
          key: 'test',
          initials: ''
        )
      end.to raise_error 'User Information Missing'
    end

    it 'instantiates without complaint when its fields are filled out' do
      expect do
        UserConfiguration.new(
          name: 'Haskell Pointer',
          email: 'haskell.pointer@asynchrony.com',
          key: 'haskell.pointer',
          initials: 'hp'
        )
      end.to_not raise_error
    end
  end

  describe '#==' do
    it 'is true when they have equal fields' do
      one = UserConfiguration.new initials: 'hp',
                                  email: 'haskell.pointer@asynchrony.com',
                                  key: 'haskell.pointer',
                                  name: 'Haskell Pointer'

      two = UserConfiguration.new initials: 'hp',
                                  email: 'haskell.pointer@asynchrony.com',
                                  key: 'haskell.pointer',
                                  name: 'Haskell Pointer'
      expect(one).to eq two
    end

    it 'is false when they have equal fields' do
      one = UserConfiguration.new initials: 'hp',
                                  email: 'haskell.pointer@asynchrony.com',
                                  key: 'haskell.pdfasdointer',
                                  name: 'Haskell Pointer'

      two = UserConfiguration.new initials: 'lp',
                                  email: 'hdfadter@asynchrony.com',
                                  key: 'haskell.pointer',
                                  name: 'Haskell Pointer'
      expect(one).to_not eq two
    end
  end
end
