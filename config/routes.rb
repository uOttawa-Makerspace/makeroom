Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'

  resources :bookings do
    post :approve, on: :member
  end
end
