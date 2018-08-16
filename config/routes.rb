Rails.application.routes.draw do
  
#  get 'answers/index'
#  get 'answers/show'
#  get 'answers/new'
#  get 'answers/edit'
#  get 'answers/create'
#  get 'answers/update'
#  get 'answers/destroy'
	resources :answers
	resources :questions
#  get 'questions/index'
#  get 'questions/show'
#  get 'questions/new'
#  get 'questions/edit'
#  get 'questions/update'
#  get 'questions/create'
#  get 'questions/destroy'

  get 'static_pages/home'
  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end







