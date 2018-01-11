Rails.application.routes.draw do

  get 'contacts/index', as: 'contacts'
  get 'contacts/new', as: 'new_contact'
  post '/contacts/create'
  root 'contacts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
