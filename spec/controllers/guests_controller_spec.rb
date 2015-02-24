require 'rails_helper'

describe GuestsController do
  let(:guest_groups_repository) { double }
  let(:guests_repository) { double }
  before do
    allow(GuestGroupsRepository).to receive(:new).and_return(guest_groups_repository)
    allow(GuestsRepository).to receive(:new).and_return(guests_repository)
  end

  describe 'GET #show' do
    before { get :show }
    it { expect(response).to render_template :show }
  end

  describe 'POST #create' do
    before do
      expect(guest_groups_repository).to receive(:find_by_guest_name).with('First Last').and_return(guest_group)
      post :create, guest: { name: 'First Last' }
    end

    describe 'finds guest group' do
      let(:guest_group) { build(:guest_group) }
      it { expect(response).to render_template :create, locals: { guest_group: guest_group } }
    end

    describe 'does not find guest group' do
      let(:guest_group) { nil }
      it { expect(flash[:alert]).to eq I18n.t('views.rsvp.create.error') }
      it { expect(response).to render_template :show }
    end
  end

  describe 'PUT #update' do
    let(:guest) { create(:guest) }
    let(:guest_group) { guest.guest_group }
    let(:comments) { { comments: 'New Comments' } }
    before do
      expect(guests_repository).to receive(:update).with(guest.id, 'New Name')
      expect(guest_groups_repository).to receive(:update).with(guest_group.id.to_s, comments)
      put :update, id: guest_group.id, guest_group: comments, guest: { guest.id => 'New Name' }
    end

    it { expect(flash[:notice]).to eq I18n.t('views.rsvp.update.thanks') }
    it { expect(response).to redirect_to recommendations_path }
  end
end
