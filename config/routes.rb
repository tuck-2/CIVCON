Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions: 'companies/sessions',
    passwords: 'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/products/download/:id' => 'products#download', as: "download_drawing"
  resources :companies, only: [:index, :show]
  resources :products do
    resources :estimates, only: [:new, :create]
  end
  resources :estimates, only: [:index, :show, :update, :destroy]

end
