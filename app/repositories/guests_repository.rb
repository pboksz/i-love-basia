class GuestsRepository
  attr_reader :klass

  def initialize
    @klass = Guest
  end

  def find_all(attributes)
    klass.where(attributes)
  end

  def find(attributes)
    find_all(attributes).first
  end

  def update(id, attributes)
    model = find(id: id)
    model.update_attributes(attributes)

    model
  end
end
