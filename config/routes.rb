Rails.application.routes.draw do
  get '/' => 'static#index'
  
  get 'team' => 'static#team'

  get 'contact' => 'static#contact'

  get 'welcome/:first_name' => 'static#welcome'
end

# ', to:' == ' => '