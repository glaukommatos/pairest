class UserConfiguration
  attr_reader :name, :email, :key, :initials

  def initialize(name: nil, email: nil, key: nil, initials: nil)
    @name = name
    @email = email
    @key = key
    @initials = initials

    raise 'User Information Missing' unless everything_defined?
  end

  def ==(other)
    state_variables == other.state_variables
  end

  private

  def everything_defined?
    [name, email, key, initials].all? do |attribute|
      attribute.class == String && !attribute.empty?
    end
  end

  protected

  def state_variables
    [name, email, key, initials]
  end
end
