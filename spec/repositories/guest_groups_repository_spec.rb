require 'rails_helper'

describe GuestGroupsRepository do
  subject { GuestGroupsRepository.new }

  describe '#after_initialize' do
    it { expect(subject.klass).to eq GuestGroup }
  end

  describe '#ordered' do
    let!(:guest1) { create(:guest, name: 'First B') }
    let!(:guest2) { create(:guest, name: 'First A') }

    it { expect(subject.ordered.flat_map(&:guests)).to eq [guest2, guest1] }
  end

  describe '#new' do
    describe 'without attributes' do
      it { expect(subject.new).to be_a GuestGroup }
      it { expect(subject.new.guests.size).to eq 6 }
      it { expect(subject.new.guests.first).to be_a Guest }
    end

    describe 'with attributes' do
      it { expect(subject.new(comments: 'comments').comments).to eq 'comments' }
    end
  end

  describe '#create' do
    describe 'with guest attributes' do
      let(:attributes) { { guests: [{ 'name' => '' }, { 'name' => 'First Last' }] } }

      it { expect(subject.create(attributes).guests.map(&:name)).to include 'First Last' }
      it { expect(subject.create(attributes).guests.map(&:name)).not_to include '' }
    end

    describe 'without guest attributes' do
      it { expect(subject.create).to be_a GuestGroup }
      it { expect(subject.create.guests).to be_empty }
    end
  end

  describe '#update' do
    let!(:guest) { create(:guest) }
    let!(:guest_group) { guest.guest_group }

    describe 'without guest attributes' do
      let(:attributes) { { comments: 'New Comments' } }
      it { expect(subject.update(guest_group.id, attributes).comments).to eq 'New Comments' }
    end

    describe 'with guest attributes' do
      let(:attributes) { { comments: '', guests: [{ id: guest.id, name: 'New Name' }] } }
      it { expect(subject.update(guest_group.id, attributes).guests.map(&:name)).to include 'New Name' }
    end
  end

  describe '#find_by_guest_name' do
    describe 'no guests' do
      it { expect(subject.find_by_guest_name('Last')).to be_nil }
    end

    describe 'guests in two groups' do
      let!(:guest1) { create(:guest) }
      let!(:guest2) { create(:guest) }
      it { expect(subject.find_by_guest_name('Last')).to be_nil }
    end

    describe 'guest in one group' do
      let!(:guest) { create(:guest) }
      it { expect(subject.find_by_guest_name('Last')).to eq guest.guest_group }
    end
  end
end
