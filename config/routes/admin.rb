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
  resources :payments do
    resources :splitsettlements
  end
  resources :accounts
  root :to => "home#index"
  resources :products do
    resources :splits
    resources :payments
  end
end
