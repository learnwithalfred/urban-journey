Rails.application.routes.draw do
  devise_for :users
  root to: "splash#index"

  resources :groups, except: [:edit, :update] do
    resources :entities, except: [:edit, :update]
  end

end
