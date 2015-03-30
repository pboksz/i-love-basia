Rails.application.routes.draw do
  admin_auth_routes

  scope '(:locale)', locale: /(en|pl)/ do
    namespace :admin do
      resources :guests
    end

    get '/information', to: 'home#information'
    get '/our_story', to: 'home#our_story'
    get '/gallery', to: 'home#gallery'
    get '/recommendations', to: 'home#recommendations'
    get '/contact_us', to: 'home#contact_us'
    get '/rsvp', to: 'home#rsvp'

    resource :guests, only: [:show, :create, :update]

    get 'sitemap(.xml)' => 'home#sitemap', format: 'xml'

    root 'home#information'
  end
end
