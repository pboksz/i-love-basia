class GuestGroupsRepository
  attr_reader :klass

  def initialize
    @klass = GuestGroup
  end

  def all
    klass.all
  end

  def new(attributes = {})
    group = klass.new(attributes)
    group.guests = (1..6).map { guests_repository.new }

    group
  end

  def create(attributes = {})
    if guests_attributes = attributes.delete(:guests).reject { |attrs| attrs['name'].blank? }
      group = klass.create(attributes)
      create_guests(group.id, guests_attributes)

      group
    end
  end

  def find_all(attributes)
    klass.where(attributes)
  end

  def find(attributes)
    find_all(attributes).first
  end

  def update(id, attributes)
    if guests_attributes = attributes.delete(:guests)
      group = update(id, attributes)
      update_guests(guests_attributes)

      group
    end
  end

  def destroy(id)
    klass.destroy(id)
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def create_guests(group_id, guests_attributes)
    guests_attributes.each do |guest_attributes|
      guests_repository.create(guest_attributes.merge(guest_group_id: group_id))
    end
  end

  def update_guests(guests_attributes)
    guests_attributes.each do |guest_attributes|
      guest_id = guest_attributes.delete(:id)
      guests_repository.update(guest_id, guest_attributes)
    end
  end
end
