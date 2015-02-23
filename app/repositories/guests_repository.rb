class GuestsRepository
  attr_reader :klass

  def initialize
    @klass = Guest
  end

  def all
    klass.all
  end

  def new(attributes = {})
    klass.new(attributes)
  end

  def create(attributes = {})
    klass.create(attributes)
  end

  def find_all(attributes)
    klass.where(attributes)
  end

  def find(attributes)
    find_all(attributes).first
  end

  def find_by_name(name)
    guests = klass.where('name LIKE ?', "%#{name}%")
    guests.size == 1 ? guests.first : nil
  end

  def update(id, attributes)
    model = find(id: id)
    model.update_attributes(attributes)

    model
  end
end
