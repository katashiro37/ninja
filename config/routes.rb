Rails.application.routes.draw do
  
  resources :tasks do
      collection do
        post :sort 
      end
  end
  
  get 'home/index'

  devise_for :users, path: 'auth', controllers: {registrations: :custom_registrations}, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # get 'contacts/index', as: 'contacts'
  # get 'contacts/new', as: 'new_contact'
  # post 'contacts/create', as: 'create_contact'
  # get 'contact/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  # patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'
  # delete 'contacts/:id/destroy', to: 'contacts#destroy', as: 'destroy_contact'
  # resources :contacts, except:[:show] do
  resources :contacts do
      # collection do
      #   get 'autocomplete'
      # end
      get 'autocomplete', on: :collection
      get 'delete', on: :member
  end

  resources :dashboard do
     collection do
        post :sort 
     end
  end

  post '/groups', to: 'groups#create'

  # get '/dashboard', to: 'dashboard#index'

  root 'home#index'


  # get 'dashboard/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
