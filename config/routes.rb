Rails.application.routes.draw do
  scope '(:locale)', locale: /(en|pl)/ do
    get '/information', to: 'home#information'
    get '/gallery', to: 'home#gallery'
    get '/recommendations', to: 'home#recommendations'
    get '/contact_us', to: 'home#contact_us'

    get 'sitemap(.xml)' => 'home#sitemap', format: 'xml'

    root 'home#information'
  end
end
