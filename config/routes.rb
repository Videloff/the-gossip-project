Rails.application.routes.draw do

  get 'team' => 'statics#team'
  get 'contact' => 'statics#contact'
  get 'welcome/:first_name' => 'statics#welcome'

  resources :gossips
 
  
  # set le root en redirigeant le / vers /gossips 
  root to: redirect('/gossips')
  
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :comments, except: [:show, :index, :new]

end
