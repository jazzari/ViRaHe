Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  root to: 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

end
