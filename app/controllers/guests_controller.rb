class GuestsController < ApplicationController
  def new
    render :new, locals: { guest: guests_repository.new }
  end

  def create
    guest = guests_repository.create(guest_params)

    if guest.persisted?
      redirect_to new_guest_path
    else
      render :new, locals: { guest: guest }
    end
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def guest_params
    params.require(:guest).permit(:name, :attending, :comments)
  end
end
