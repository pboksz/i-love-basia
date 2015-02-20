class GuestsController < ApplicationController
  def show
    render :show
  end

  def create
    if guest = guests_repository.find(name: create_params[:name])
      # TODO unless already rsvp'd?
      render :create, locals: { guests: guests_repository.find_all(id: guest.associated_guest_ids) }
    else
      # TODO error message
      render :show
    end
  end

  def update
    update_params.each do |guest_id, attributes|
      guests_repository.update(guest_id, attributes)
    end

    # TODO thank you message
    redirect_to recommendations_path(locale)
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def create_params
    params.require(:guest).permit(:name)
  end

  def update_params
    params.require(:guest).permit!
  end
end
