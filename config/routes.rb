Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/users", to: "users#index"
    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index destroy)
    resources :microposts, only: %i(create destroy)
  end
end
