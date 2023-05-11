Rails.application.routes.draw do



  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
   
  # set root redirect '/' to '/gossips' as index 
  root to: redirect('/gossips')
  
  # routes for main controllers
  resources :sessions, only: [:new, :create, :destroy]
  
  # statics links
  get 'team' => 'statics#team'
  get 'contact' => 'statics#contact'
  get 'welcome/:first_name' => 'statics#welcome'

end
