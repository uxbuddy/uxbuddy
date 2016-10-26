Rails.application.routes.draw do

  devise_for :users
  root "home#index"

  resources :tests do
    resources :reports
  end

  root 'application#index'

end
