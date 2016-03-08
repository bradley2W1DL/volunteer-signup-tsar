Rails.application.routes.draw do

  devise_for :users

  root 'signups#index'
  get 'fetch_shifts' => 'shifts#fetch_shifts'
  resources :signups
  resources :shifts

  get 'contact' => 'pages#contact'
end
