class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    render :index, locals: { guests: guests_repository.all }
  end

  def new
    guests = (1..6).map { guests_repository.new }
    render :new, locals: { guests: guests }
  end

  def create
    guests = create_params.map do |id, attributes|
      guests_repository.find_or_create(attributes)
    end.compact

    guests.each do |guest|
      guests_repository.update(guest.id, associated_guest_ids: guests.map(&:id))
    end

    redirect_to admin_guests_path(locale)
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def create_params
    params.require(:guest).reject { |id, attributes| attributes[:name].blank? }.permit!
  end
end
