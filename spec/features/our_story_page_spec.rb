require 'rails_helper'

describe 'Our Story page' do
  before { visit our_story_path }

  it 'has our story' do
    expect(page).to have_text I18n.t('views.our_story.header')
    expect(page).to have_text I18n.t('views.our_story.groom.header')
    expect(page).to have_text I18n.t('views.our_story.bride.header')
  end
end
