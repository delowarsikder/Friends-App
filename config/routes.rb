Rails.application.routes.draw do
  devise_for :users
  resources :friends
  root 'home#index' ##select this as defaut home pages
  get 'home/aboutUs'
  get 'say/hello'
  get 'say/goodbye'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
