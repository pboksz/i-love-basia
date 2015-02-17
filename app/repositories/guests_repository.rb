class GuestsRepository
  attr_reader :klass

  def initialize
    @klass = Guest
  end

  def new(attributes = {})
    klass.new(attributes)
  end

  def create(attributes = {})
    klass.create(attributes)
  end
end
