Rails.application.routes.draw do
  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

	resources :answers
	resources :questions
  resources :quizzes, only: :show do
    collection do
      get :random
    end
  end
  resources :quiz_answers, only: :create
  resources :correctly_answered_questions, only: :destroy


  resources :static_pages, only: :show
  #get 'static_pages/home'
  #get 'static_pages/help'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end







