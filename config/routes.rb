Rails.application.routes.draw do
  resources :franchises do
    resources :adventures
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  
  root "application#home"
  
end
