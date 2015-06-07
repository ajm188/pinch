Rails.application.routes.draw do
  root 'site#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events, param: :event_id
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :nonprofits

  resources :users, only: [:show, :update], param: :user_id do
    member do
      resources :events, only: [:index], param: :event_id
    end
    member do
      resources :posts, only: [:index], param: :post_id
    end
  end
end
