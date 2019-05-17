Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/homepage', to: 'registrations#homepage', as: 'users_homepage', :controllers => { registrations: 'registrations' }

  root "application#home"

  resources :franchises do
    resources :adventures
  end

  resources :villains

  devise_for :users, :controllers => { :registration => "registration", :omniauth_callbacks => "callbacks"}


  # devise_scope :user do
  #   get 'dashboard', to: 'devise/registrations#homepage' 
  # end
  
end
