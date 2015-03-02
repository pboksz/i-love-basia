require 'rails_helper'

describe Guest do
  describe '#last_name' do
    it { expect(build(:guest).last_name).to eq 'Last' }
  end
end
