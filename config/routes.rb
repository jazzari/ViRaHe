Rails.application.routes.draw do
  
  	ActiveAdmin.routes(self)
  	root to: 'home#index'
  	devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

  	namespace :admin do
	    resources :simulators do
	      resources :tracks 
	      resources :cars 
	    end
	end

end
