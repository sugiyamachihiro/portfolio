Rails.application.routes.draw do

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

    resources :users
    resources :cats do
      resources :cat_images
      resource :favorites, only: [:create, :destroy]
    end
    resources :rooms
end
