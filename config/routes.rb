Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/homepage', to: 'registrations#homepage', as: 'users_homepage', :controllers => { registrations: 'registrations' }

  root "application#home"

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :villains
  resources :franchises do
    resources :adventures
  end

  # devise_scope :user do
  #   get 'dashboard', to: 'devise/registrations#homepage' 
  # end
  
end
