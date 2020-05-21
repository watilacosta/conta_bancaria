Rails.application.routes.draw do
  resources :transferencias
  root 'home#index'
  
  devise_for :clientes, controllers: { 
    registrations: 'clientes/registrations',
    sessions: 'clientes/sessions'
  }

  resources :depositos, only: %i[new create show]
  resources :contas, only: %i[new create edit update show]
end
