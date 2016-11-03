Rails.application.routes.draw do

  devise_for :users
  resources :reports, only: [:show, :index] do
    get 'unknown', to: 'application#unknown'
  end
  resources :tests, only: [:index, :create, :new, :show] do
    resources :answers, only: [:create]
    member do
      get 'share'
      get 'thanks'
      post 'email'
    end
  end

  root 'application#home'

  get '*path', to: 'application#unknown', as: 'unknown'

end
