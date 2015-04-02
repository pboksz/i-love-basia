require 'rails_helper'

describe 'Home page' do
  before { visit root_path }

  it 'has header info' do
    expect(page).to have_link I18n.t('views.header.information'), href: information_path
    expect(page).to have_link I18n.t('views.header.our_story'), href: our_story_path
    expect(page).to have_link I18n.t('views.header.gallery'), href: gallery_path
    expect(page).to have_link I18n.t('views.header.recommendations'), href: recommendations_path
    expect(page).to have_link I18n.t('views.header.rsvp'), href: rsvp_path
    expect(page).to have_link I18n.t('views.header.contact_us'), href: contact_us_path
  end

  it 'has locale switcher' do
    expect(page).to have_link '', href: information_path(locale: :pl)
    find('.locales a').click

    expect(page).to have_link I18n.t('views.header.information', locale: :pl), href: information_path(locale: :pl)
    expect(page).to have_link I18n.t('views.header.our_story', locale: :pl), href: our_story_path(locale: :pl)
    expect(page).to have_link I18n.t('views.header.gallery', locale: :pl), href: gallery_path(locale: :pl)
    expect(page).to have_link I18n.t('views.header.recommendations', locale: :pl), href: recommendations_path(locale: :pl)
    expect(page).to have_link I18n.t('views.header.rsvp', locale: :pl), href: rsvp_path(locale: :pl)
    expect(page).to have_link I18n.t('views.header.contact_us', locale: :pl), href: contact_us_path(locale: :pl)
  end

  it 'has information and countdown' do
    expect(page).to have_text I18n.t('views.information.header')
    expect(page).to have_text I18n.t('views.information.countdown.header')
  end
end
