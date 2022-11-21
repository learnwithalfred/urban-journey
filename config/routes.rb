Rails.application.routes.draw do
  resources :groups
  devise_for :users
  root to: "splash#index"

end
