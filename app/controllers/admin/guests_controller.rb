class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    render :index, locals: { guest_groups: guest_groups_repository.all }
  end

  def new
    render :new, locals: { guest_group: guest_groups_repository.new }
  end

  def create
    guest_groups_repository.create(guest_params)
    redirect_to admin_guests_path(locale)
  end

  def edit
    render :edit, locals: { guest_group: guest_groups_repository.find(id: params[:id]) }
  end

  def update
    guest_groups_repository.update(params[:id], guest_params)
    redirect_to admin_guests_path(locale)
  end

  def destroy
    guest_groups_repository.destroy(params[:id])
    redirect_to admin_guests_path(locale)
  end

  private

  def guest_groups_repository
    @guest_groups_repository ||= GuestGroupsRepository.new
  end

  def guest_params
    params.require(:guest_group).permit(guests: [:id, :name])
  end
end
