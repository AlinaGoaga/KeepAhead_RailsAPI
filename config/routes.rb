# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :venues do
        resources :donations
      end
    end
  end
end
