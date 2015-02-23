class GuestsRepository < DefaultRepository
  def after_initialize
    @klass = Guest
  end

  def find_by_name(name)
    guests = klass.where('name LIKE ?', "%#{name}%")
    guests.size == 1 ? guests.first : nil
  end
end
