Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'weather', to: 'weather#index'
  resources :weather
  get 'search', to: 'weather#search'

end