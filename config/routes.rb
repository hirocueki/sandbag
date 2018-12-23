Rails.application.routes.draw do

  root "blogs#index"
  resources :blogs do
    resources :posts do
      resources :comments
      resources :likes, only: %i(create destroy), module: :posts
    end
  end

  resources :users, only: %i[show index]
end
