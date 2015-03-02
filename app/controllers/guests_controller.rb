class GuestsController < ApplicationController
  def show
    render :show
  end

  def create
    if guest_group = guest_groups_repository.find_by_guest_name(create_params[:name])
      render :create, locals: { guest_group: guest_group }
    else
      flash.now[:alert] = t('views.rsvp.create.error')
      render :show
    end
  end

  def update
    update_params.each { |id, attributes| guests_repository.update(id, attributes) }
    guest_group = guest_groups_repository.update(params[:id], guest_group_params)
    RsvpMailer.rsvp_email(guest_group).deliver_now

    flash[:notice] = t('views.rsvp.update.thanks')
    redirect_to recommendations_path(locale)
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end

  def guest_groups_repository
    @guest_groups_repository ||= GuestGroupsRepository.new
  end

  def create_params
    params.require(:guest).permit(:name)
  end

  def update_params
    params.require(:guest).permit!
  end

  def guest_group_params
    params.require(:guest_group).permit(:comments)
  end
end
