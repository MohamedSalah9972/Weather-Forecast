Rails.application.routes.draw do
  root "weather#index"
  resources :weather
  get 'search', action: :search, controller: 'weather'
end
