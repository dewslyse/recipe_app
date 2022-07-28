Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users , only: [:index, :show] do
    resources :foods,:recipes  , only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods 
    end
  end 
  root "foods#index"
  get '/recipes', to: 'recipes#index'
  match '/users/:user_id/recipes/:recipe_id/shopping_list', to: 'recipes#shopping_list', via: 'get'
  get '/public_recipes', to: 'public_recipes#index'
end
