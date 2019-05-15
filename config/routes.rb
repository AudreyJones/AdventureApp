Rails.application.routes.draw do
  resources :heros
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :franchises do
    resources :adventures
  end
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "application#home"
  
end
