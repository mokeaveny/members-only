Rails.application.routes.draw do

	resources :users, only: [:new, :create]

	resources :posts, only: [:new, :create, :index]

	root 'posts#index'

	get 'login', to: 'sessions#new'

	get 'signup', to: 'users#new'
	
	post 'login', to: 'sessions#create'

	get 'logout', to: 'sessions#destroy'
	
	get 'welcome', to: 'sessions#welcome'

	get 'authorized', to: 'posts#new'

end
