Rails.application.routes.draw do
  patch 'posts/:id/like', to: 'posts#like', as: 'like_post'
  resources :posts, only: [:create, :edit, :new, :update, :show]
  resources :bloggers, only: [:create, :new, :show]
  resources :destinations, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
