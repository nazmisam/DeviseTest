devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  confirmations: 'admins/confirmations'
}

devise_scope :admin do
  authenticated :admin do
    root 'admins/dashboards#index', as: :authenticated_admin_root
  end

  unauthenticated :admin do
    root 'admins/sessions#new', as: :unauthenticated_admin_root
  end
end

namespace :admins, as: :admin do
  resources :payments
  resources :accounts
  resources :splits
  root :to => "home#index"
  resources :products do
    resources :payments do
    
    end
  end
end
