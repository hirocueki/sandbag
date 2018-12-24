Rails.application.routes.draw do

  devise_for :users
  root "blogs#index"
  resources :blogs do
    resources :posts do
      resources :comments do
        resources :likes, only: %i(create destroy), module: :comments
      end
      resources :likes, only: %i(create destroy), module: :posts
    end
  end

  resources :users, only: %i[show index]
end
