Rails.application.routes.draw do

  root to: 'home#index'
  post "/signup" => "signup#create"
  post "/signin" => "signin#create"

  namespace :api do
    namespace :v1 do
      resources :venues do
        resources :donations
      end
    end
  end
end
