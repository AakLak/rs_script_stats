Rails.application.routes.draw do
  namespace :admin do
    resources :commits
    resources :scripts
    resources :users
    resources :stats

    root to: "commits#index"
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :scripts
      resources :commits
      resources :stats
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
