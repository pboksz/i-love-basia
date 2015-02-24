class GuestGroupsRepository < DefaultRepository
  def after_initialize
    @klass = GuestGroup
  end

  def new(attributes = {})
    group = klass.new(attributes)
    group.guests = new_guests

    group
  end

  def create(attributes = {})
    guests_attributes = attributes.delete(:guests)
    group = super(attributes)

    if guests_attributes
      present_guests_attributes = guests_attributes.reject { |attrs| attrs['name'].blank? }
      create_guests(group.id, present_guests_attributes)
    end

    group
  end

  def update(id, attributes)
    guests_attributes = attributes.delete(:guests)
    group = super(id, attributes)
    update_guests(guests_attributes) if guests_attributes

    group
  end

  def find_by_guest_name(name)
    guest_groups = guests_repository.find_by_name(name).map(&:guest_group).uniq
    guest_groups.first if guest_groups.count == 1
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def new_guests
    (1..6).map { guests_repository.new }
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
