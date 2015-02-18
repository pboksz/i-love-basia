class Admin::GuestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    render :index
  end
end
