class DefaultRepository
  attr_reader :klass

  def initialize(klass = nil)
    @klass = klass
    after_initialize
  end

  def after_initialize

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

  def update(id, attributes)
    model = find(id: id)
    model.update_attributes(attributes)

    model
  end

  def destroy(id)
    klass.destroy(id)
  end
end
