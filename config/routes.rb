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
  #会員側のルーティング設定
  namespace :public do
    resources :companies, only: [:index, :show]
  end

end
