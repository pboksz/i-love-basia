require 'rails_helper'

describe Admin::GuestsController do
  let(:guest_groups_repository) { double }
  let(:guests_repository) { double }
  before do
    allow(controller).to receive(:authenticate_admin!)
    allow(GuestGroupsRepository).to receive(:new).and_return(guest_groups_repository)
    allow(GuestsRepository).to receive(:new).and_return(guests_repository)
  end

  describe 'GET #index' do
    let(:guest_groups) { double }
    let(:responses) { double }
    before do
      expect(guest_groups_repository).to receive(:all).and_return(guest_groups)
      expect(guests_repository).to receive(:responses).and_return(responses)
      get :index
    end

    it { expect(response).to render_template :index, locals: { guest_groups: guest_groups, responses: responses } }
  end

  describe 'GET #new' do
    let(:guest_group) { double }
    before do
      expect(guest_groups_repository).to receive(:new).and_return(guest_group)
      get :new
    end

    it { expect(response).to render_template :new, locals: { guest_group: guest_group } }
  end

  describe 'POST #create' do
    let(:guest_params) { { guests: [{ name: 'New Name' }] } }
    before do
      expect(guest_groups_repository).to receive(:create).with(guest_params)
      post :create, guest_group: guest_params
    end

    it { expect(response).to redirect_to admin_guests_path }
  end

  describe 'GET #edit' do
    let(:guest_group) { double(id: '1') }
    before do
      expect(guest_groups_repository).to receive(:find).with(id: guest_group.id).and_return(guest_group)
      get :edit, id: guest_group.id
    end

    it { expect(response).to render_template :edit, locals: { guest_group: guest_group } }
  end

  describe 'PUT #update' do
    let(:guest_group) { double(id: '1') }
    let(:guest_params) { { guests: [{ id: '1', name: 'New Name' }] } }
    before do
      expect(guest_groups_repository).to receive(:update).with(guest_group.id, guest_params)
      put :update, id: guest_group.id, guest_group: guest_params
    end

    it { expect(response).to redirect_to admin_guests_path }
  end

  describe 'DELETE #destroy' do
    let(:guest_group) { double(id: '1') }
    before do
      expect(guest_groups_repository).to receive(:destroy).with(guest_group.id)
      delete :destroy, id: guest_group.id
    end

    it { expect(response).to redirect_to admin_guests_path }
  end
end
