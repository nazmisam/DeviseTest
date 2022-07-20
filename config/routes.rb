Rails.application.routes.draw do
  
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root :to => "home#index"
  draw :user
  draw :admin

  resources :products do
    resources :payments
    resources :splits
  end
end
