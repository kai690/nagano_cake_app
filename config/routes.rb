Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create]
  resources :orders, only: [:index, :new, :create, :show]
  resources :customers
  resources :addresses
  get "unsubscribe" => "customers#unsubscribe"
  post "deactivate" => "customers#deactivate"
  # 管理者側
  namespace :admin do

    get "homes" => "homes#top"

    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers, only: [:index, :edit, :update, :show]
  end

end
