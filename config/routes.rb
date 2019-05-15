Rails.application.routes.draw do
  resources :villains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :franchises do
    resources :adventures
  end

  # get '/homepage', to: 'registrations#homepage', as: 'users_homepage', :controllers => { registrations: 'registrations' }
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  
  devise_scope :user do
    get 'homepage', to: 'devise/registrations#show'
  end
  
  
  root "application#home"
  
end
