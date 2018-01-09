Rails.application.routes.draw do
  get 'contacts/index'
  root 'contacts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
