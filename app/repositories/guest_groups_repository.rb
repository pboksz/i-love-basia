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
      guests_attributes.each do |guest_attributes|
        guests_repository.create(guest_attributes.merge(guest_group_id: group.id))
      end

      group
    end
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end
end
