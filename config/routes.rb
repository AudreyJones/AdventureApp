Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/homepage', to: 'registrations#homepage', as: 'users_homepage', :controllers => { registrations: 'registrations' }

  root "application#home"

  resources :franchises do
    resources :adventures, only: [:new, :index, :show, :destroy]
  end

  resources :adventures
  resources :villains

  devise_for :users, :controllers => { :registration => "registration", :omniauth_callbacks => "callbacks"}

  get 'devise/registrations/dashboard', to: 'application#dashboard', as: '/dashboard'

  
  get 'search', to: 'application#search' , as: 'search'
  
  
  resources :users, only: [:edit, :update]
end
