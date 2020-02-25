require 'rails_helper'

describe 'Gallery page', feature: true do
  let(:image_count) { ImageLocator.new.image_names.count }
  before { visit gallery_path }

  it 'has gallery images' do
    expect(all('.image').count).to eq image_count
  end
end
