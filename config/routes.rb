Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :clientes, controllers: { 
    registrations: 'clientes/registrations',
    sessions: 'clientes/sessions'
  }
  
  resources :depositos, only: %i[show new create]
  resources :contas, only: %i[show new create edit update]
  resources :saques, only: %i[show new create]
  resources :transferencias
end
