Rails.application.routes.draw do

  devise_for :users
  resources :tests do
    resources :report
  end

  root 'application#index'

end
