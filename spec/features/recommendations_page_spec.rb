require 'rails_helper'

describe 'Recommendations page', feature: true do
  before { visit recommendations_path }

  it 'has each section' do
    expect(page).to have_text I18n.t('views.recommendations.transportation.header')
    expect(page).to have_text I18n.t('views.recommendations.hotels.header')
    expect(page).to have_text I18n.t('views.recommendations.restaurants.header')
    expect(page).to have_text I18n.t('views.recommendations.bars.header')
    expect(page).to have_text I18n.t('views.recommendations.places.header')
    expect(page).to have_text I18n.t('views.recommendations.shopping.header')
  end
end
