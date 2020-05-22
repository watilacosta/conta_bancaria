Rails.application.routes.draw do
  get 'extratos/index'
  root 'home#index'

  devise_for :clientes, controllers: {
    registrations: 'clientes/registrations',
    sessions: 'clientes/sessions'
  }

  resources :depositos, only: %i[show new create]
  resources :contas, only: %i[show new create edit update] do
    member do
      get 'extrato'
    end
  end
  resources :saques, only: %i[show new create]
  resources :transferencias, only: %i[show new create]
end
