Rails.application.routes.draw do

  devise_for :users
  resources :tests do
    resources :answers, only: [:create]
    resources :report
    member do
      get 'share'
      get 'thanks'
    end
  end

  root 'application#index'

end
