Rails.application.routes.draw do
  root "dashboard#index"

  resources :produtos
  resources :pedidos
  resources :clientes
  resources :fornecedores
  resources :financeiro, only: [:index, :new, :create, :destroy]
  
  get "relatorios", to: "relatorios#index", as: :relatorios
end