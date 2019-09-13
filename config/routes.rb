Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :lists
      post 'authenticate', to: 'authentication#authenticate'
      post 'register', to: 'authentication#register'
    end
  end
end
