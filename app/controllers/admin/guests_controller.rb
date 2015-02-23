class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    render :index, locals: { guest_groups: guest_groups_repository.all }
  end

  def new
    render :new, locals: { guest_group: guest_groups_repository.new }
  end

  def create
    guest_groups_repository.create(create_params)
    redirect_to admin_guests_path(locale)
  end

  private

  def guest_groups_repository
    @guest_groups_repository ||= GuestGroupsRepository.new
  end

  def create_params
    params.require(:guest_group).permit(guests: [:name])
  end
end
