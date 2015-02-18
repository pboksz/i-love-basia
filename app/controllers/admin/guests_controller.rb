class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    render :index, locals: { guests: guests_repository.all }
  end

  private

  def guests_repository
    @guests_repository ||= GuestsRepository.new
  end
end
