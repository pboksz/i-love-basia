class HomeController < ApplicationController
  def information
    render :information
  end

  def our_story
    render :our_story
  end

  def gallery
    render :gallery, locals: { image_names: image_locator.image_names }
  end

  def recommendations
    render :recommendations
  end

  def rsvp
    redirect_to guests_path(locale)
  end

  def contact_us
    render :contact_us
  end

  private

  def image_locator
    @image_locator ||= ImageLocator.new
  end
end
