require 'rails_helper'

describe HomeController do
  describe 'GET #information' do
    before { get :information }
    it { expect(response).to render_template :information }
  end

  describe 'GET #gallery' do
    let(:image_names) { double }
    let(:image_locator) { double(image_names: image_names) }
    before do
      allow(ImageLocator).to receive(:new).and_return(image_locator)
      get :gallery
    end

    it { expect(response).to render_template :gallery, locals: { image_names: image_locator.image_names } }
  end

  describe 'GET #recommendations' do
    before { get :recommendations }
    it { expect(response).to render_template :recommendations }
  end

  describe 'GET #contact_us' do
    before { get :contact_us }
    it { expect(response).to render_template :contact_us }
  end

  describe 'GET #sitemap' do
    before { get :sitemap, format: 'xml' }
    it { expect(response).to render_template :sitemap, layout: false }
  end
end
