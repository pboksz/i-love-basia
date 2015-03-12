require 'rails_helper'

describe ApplicationHelper do
  describe '#gallery_tag' do
    subject { helper.gallery_tag('01.jpg') }

    it { expect(subject).to include 'class="image"' }
    it { expect(subject).to include 'a href="#" class="no-link"' }
    it { expect(subject).to include 'data-featherlight' }
    it { expect(subject).to include 'gallery/01.jpg' }
  end

  describe '#outside_link_tag' do
    describe 'without map link' do
      subject { helper.outside_link_tag('Text', 'http://link.com') }

      it { expect(subject).to include 'href="http://link.com"' }
      it { expect(subject).to include 'target="_blank"' }
      it { expect(subject).to include 'Text' }
      it { expect(subject).not_to include 'class="map-link"' }
      it { expect(subject).not_to include 'href="http://map.com"' }
      it { expect(subject).not_to include 'i class="fa fa-map-marker"' }
    end

    describe 'with map link' do
      subject { helper.outside_link_tag('Text', 'http://link.com', map: 'http://map.com') }

      it { expect(subject).to include 'class="map-link"' }
      it { expect(subject).to include 'href="http://map.com"' }
      it { expect(subject).to include 'i class="fa fa-map-marker"' }
    end
  end

  describe '#attending_tag' do
    subject { helper.attending_tag(attending) }

    describe 'no response' do
      let(:attending) { nil }
      it { expect(subject).to eq 'No Response' }
    end

    describe 'not attending' do
      let(:attending) { false }
      it { expect(subject).to eq 'Declined' }
    end

    describe 'attending' do
      let(:attending) { true }
      it { expect(subject).to eq 'Accepted' }
    end
  end

  describe '#comments_tag' do
    subject { helper.comments_tag(comments) }

    describe 'blank' do
      let(:comments) { '' }
      it { expect(subject).to include '&nbsp;' }
    end

    describe 'short comments' do
      let(:comments) { '123456789' }
      it { expect(subject).to include comments }
    end

    describe 'long comments' do
      let(:comments) { '1234567890 1234567890 1234567890' }
      it { expect(subject).to include comments.truncate(30) }
    end
  end
end
