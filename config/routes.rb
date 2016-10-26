Rails.application.routes.draw do

  devise_for :users
  resources :tests do
    resources :report
    member do
      get 'thanks'
    end
  end

  root 'application#index'

end
