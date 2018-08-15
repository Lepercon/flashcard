Rails.application.routes.draw do
  get 'answers/text:string'
  get 'answers/correct:boolean'
	resources :questions
  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/create'
  get 'questions/update'
  get 'questions/destroy'
  get 'static_pages/home'
  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end




#IGNORE: FROM QUESTIONS INDEX VIEW
#<%= quest = Question.order("RANDOM()").limit(1) %>
#<% @questions.each do |quest| %>
#	<%= quest.text %>
#<% end %> 


