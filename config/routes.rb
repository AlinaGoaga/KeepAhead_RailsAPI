Rails.application.routes.draw do

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :venues do
        resources :donations
      end
    end
  end
end
