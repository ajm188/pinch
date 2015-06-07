Rails.application.routes.draw do
  root 'site#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: [:show, :update] do
    # member do
    #   get 'skills', to: "skills#index"
    #   patch 'skills', to: "user#update_attributes"
    # end
  end
end
