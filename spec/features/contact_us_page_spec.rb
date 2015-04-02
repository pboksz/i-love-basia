require 'rails_helper'

describe 'Contact Us page' do
  before { visit contact_us_path }

  it 'has email contact' do
    expect(page).to have_text I18n.t('views.contact_us.header')
    expect(page).to have_link '', href: 'mailto:basiaandphillip@gmail.com?subject=A%20message%20from%20ilovebasia.com'
  end
end
