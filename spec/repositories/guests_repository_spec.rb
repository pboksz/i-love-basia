require 'rails_helper'

describe GuestsRepository do
  subject { GuestsRepository.new }

  describe '#after_initialize' do
    it { expect(subject.klass).to eq Guest }
  end

  describe '#find_by_name' do
    let(:query) { "REPLACE(REPLACE(name, 'ł', 'l'), 'Ł', 'L') LIKE REPLACE(REPLACE(?, 'ł', 'l'), 'Ł', 'L')" }
    before { expect(Guest).to receive(:where).with(query, "%First Last%") }

    it { subject.find_by_name('First Last') }
  end

  describe "#responses" do
    describe 'no guests in db' do
      it { expect(subject.responses).to be_empty }
    end

    describe 'guests in db' do
      let!(:guest1) { create(:guest) }
      let!(:guest2) { create(:guest) }

      it { expect(subject.responses).to include guest1.attending }
      it { expect(subject.responses).to include guest2.attending }
    end
  end
end
