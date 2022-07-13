Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

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
    resources :splits
  end
end
