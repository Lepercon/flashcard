Rails.application.routes.draw do
  
  get '/signup', to: 'users#new'
  resources :users

	resources :answers
	resources :questions

  patch 'questions/show'


  get 'static_pages/home'
  get 'static_pages/help'
  patch 'static_pages/correct'
  get 'static_pages/correct'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end







