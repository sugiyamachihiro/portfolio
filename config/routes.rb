Rails.application.routes.draw do

  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/update'
    get 'users/destroy'
  end
  get 'inquiry_rooms/show'
  root 'home#home'
  get  'about' => 'home#about'
  get  'aboutcat' => 'home#aboutcat'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users do
      resources :inquiry_rooms
    end
    resources :cats do
      resources :cat_images
      resource :favorites, only: [:create, :destroy]
    end
    resources :rooms

    namespace :admins do
    resources :users
    resources :cats
    resources :inquiry_rooms
  end

    resources :admins do
      collection do
        get :home
    end
  end

#actioncable
mount ActionCable.server => '/cable'

end
