Rails.application.routes.draw do
  root 'site#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: [:show, :update] do
    member do
      resources :events, only: [:index]
    end
  end
end
