Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :villains
  resources :franchises do
    resources :adventures
  end

  # get '/homepage', to: 'registrations#homepage', as: 'users_homepage', :controllers => { registrations: 'registrations' }
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  
  devise_scope :user do
    get 'homepage', to: 'devise/registrations#homepage'
  end
  
  
  root "application#home"
  
end
