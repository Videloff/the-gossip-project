Rails.application.routes.draw do
  get '/' => 'static#index'

  root'static#index'

  get 'welcome/:first_name' => 'static#welcome'
  
  get 'team' => 'static#team'

  get 'contact' => 'static#contact'

  get 'user/:index_user' => 'static#user'

  get '/:id' => 'static#gossip'

end
