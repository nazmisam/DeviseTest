Rails.application.routes.draw do
  resources :products
  resources :payments
  resources :checkout, only: [:create]
  get "home/index"

  # route where any visitor require the helloWorldJob to be triggered
  post "home/trigger_job"

  # where visitor are redirected once job has been called
  get "other/job_done"
  
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  
  devise_for :users
  root 'home#index'

  resources :products do
    resources :payments
  end
end
