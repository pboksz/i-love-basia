require 'rails_helper'

describe 'Rsvp page' do
  before { visit rsvp_path }

  it 'is on rsvp page' do
    expect(page).to have_text I18n.t('views.rsvp.header')
    expect(page).to have_text I18n.t('views.rsvp.show.info')
  end

  describe 'name does not match' do
    before do
      find('#guest_name').set('Invalid')
      click_button 'Next'
    end

    it 'displays error text' do
      expect(page).to have_text I18n.t('views.rsvp.create.error')
    end
  end

  describe 'name matches' do
    let!(:group) { create(:guest_group) }
    let!(:guest1) { create(:guest, guest_group: group, attending: nil, name: 'Guest One') }
    let!(:guest2) { create(:guest, guest_group: group, attending: nil, name: 'Guest Two') }
    before do
      find('#guest_name').set(guest1.name)
      click_button 'Next'
    end

    it 'finds all guests in the guest group' do
      expect(page).to have_text guest1.name
      expect(page).to have_selector "#guest_#{guest1.id}_attending_true"
      expect(page).to have_selector "#guest_#{guest1.id}_attending_false"

      expect(page).to have_text guest2.name
      expect(page).to have_selector "#guest_#{guest2.id}_attending_true"
      expect(page).to have_selector "#guest_#{guest2.id}_attending_false"

      expect(page).to have_selector '#guest_group_comments'
    end

    describe 'making rsvp' do
      let(:comments) { 'Comments and such!' }
      before do
        find("#guest_#{guest1.id}_attending_true").click
        find("#guest_#{guest2.id}_attending_false").click
        find('#guest_group_comments').set(comments)
        click_button 'RSVP'
      end

      it 'saves data' do
        expect(page).to have_text I18n.t('views.rsvp.update.thanks')
        expect(guest1.reload.attending).to eq true
        expect(guest2.reload.attending).to eq false
        expect(group.reload.comments).to eq comments
      end
    end
  end
end
