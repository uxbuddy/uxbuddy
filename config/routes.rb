Rails.application.routes.draw do

  devise_for :users
  resources :tests do
    resources :reports
  end

  root 'application#index'

end
