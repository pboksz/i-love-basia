require 'rails_helper'

describe DefaultRepository do
  let(:new_name) { 'New name' }
  let(:repository) { DefaultRepository.new(Guest) }

  describe '#all' do
    let!(:guest) { create(:guest) }
    it { expect(repository.all).to eq Guest.all }
  end

  describe '#new' do
    describe 'no attributes' do
      it { expect(repository.new).to be_a Guest }
    end

    describe 'with attributes' do
      it { expect(repository.new(name: new_name).name).to eq new_name }
    end
  end

  describe '#create' do
    describe 'valid attributes' do
      it { expect { repository.create(attributes_for(:guest)) }.to change { Guest.count }.by(1) }
    end
  end

  describe '#find_all' do
    describe 'exists in db' do
      let!(:guest) { create(:guest) }
      it { expect(repository.find_all(guest.id)).to eq [guest] }
    end

    describe 'does not exist in db' do
      it { expect(repository.find_all(1234)).to be_empty }
    end
  end

  describe '#find' do
    describe 'exists in db' do
      let!(:guest) { create(:guest) }
      it { expect(repository.find(guest.id)).to eq guest }
    end

    describe 'does not exist in db' do
      it { expect(repository.find(1234)).to be_nil }
    end
  end

  describe '#update' do
    let!(:guest) { create(:guest) }
    before { repository.update(guest.id, name: new_name) }

    it { expect(guest.reload.name).to eq new_name }
  end

  describe '#destroy' do
    let!(:guest) { create(:guest) }
    it { expect { repository.destroy(guest.id) }.to change { Guest.count }.by(-1) }
  end
end
