class GuestsController < ApplicationController
  def show
    render :show
  end

  def create
    if guest = guests_repository.find_by_name(create_params[:name])
      render :create, locals: { guest_group: guest.guest_group }
    else
      flash.now[:alert] = t('views.rsvp.create.error')
      render :show
    end
  end

  def update
    update_params.each do |guest_id, attributes|
      guests_repository.update(guest_id, attributes)
    end

    flash[:notice] = t('views.rsvp.update.thanks')
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
