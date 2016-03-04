Rails.application.routes.draw do

  devise_for :users
  root 'signups#index'
  resources :signups

end
