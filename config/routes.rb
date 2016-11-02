Rails.application.routes.draw do

  devise_for :users
  resources :reports
  resources :tests do
    resources :answers, only: [:create]
    member do
      get 'share'
      get 'thanks'
      post 'email'
    end
  end

  root 'application#home'

end
