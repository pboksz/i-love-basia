Rails.application.routes.draw do
  get '/information', to: 'home#information'
  get '/our_story', to: 'home#our_story'
  get '/gallery', to: 'home#gallery'
  get '/recommendations', to: 'home#recommendations'
  get '/contact_us', to: 'home#contact_us'
  get '/rsvp', to: 'home#rsvp'

  resources :guests, only: [:new, :create]

  root 'home#information'
end
