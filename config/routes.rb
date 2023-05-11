Rails.application.routes.draw do

  # routes for mains controllers
  resources :sessions, only: [:new, :create, :destroy]

  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
   
  # set root redirect '/' to '/gossips' as index 
  root to: redirect('/gossips')
  

  # statics links
  get 'team' => 'statics#team'
  get 'contact' => 'statics#contact'
  get 'welcome/:first_name' => 'statics#welcome'

end
