Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  resources :posts
  resources :userprofiles

  get '/like', to: "post#like_info", as: "like_info"

end
