Rails.application.routes.draw do

  devise_for :users

  root 'signups#index'
  get 'fetch_shifts' => 'shifts#fetch_shifts'
  resources :signups
  resources :shifts

  post 'edit_request' => 'signups#edit_request'
  get 'contact' => 'pages#contact'
end
