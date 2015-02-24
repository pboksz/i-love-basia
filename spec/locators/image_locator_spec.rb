require 'rails_helper'

describe ImageLocator do
  subject { ImageLocator.new }

  describe '#image_names' do
    let(:first) { subject.image_names.first }
    let(:last) { subject.image_names.last }

    it { expect(subject.image_names).to be_an Array }
    it { expect(first < last).to eq true }
  end
end
