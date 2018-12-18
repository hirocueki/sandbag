Rails.application.routes.draw do
  root "blogs#index"
  resources :blogs do
    resources :posts do
      resources :comments
    end
  end
end
