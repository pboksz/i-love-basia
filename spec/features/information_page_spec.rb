require 'rails_helper'

describe 'Information page', feature: true do
  before { visit information_path }

  it 'has information and countdown' do
    expect(page).to have_text I18n.t('views.information.header')
    expect(page).to have_text I18n.t('views.information.countdown.header')
  end
end
