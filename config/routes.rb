Rails.application.routes.draw do

  resources :tests do
    resources :reports
  end

  root 'application#index'

end
