Rails.application.routes.draw do
  root 'site#home'
  devise_for :users, controllers: { registrations: 'registrations' }
end
