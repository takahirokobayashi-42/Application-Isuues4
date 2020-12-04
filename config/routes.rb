Rails.application.routes.draw do
  get 'relationships/destroy'
  get 'relationships/create'
  get 'users/:id/follower' => 'relationships#follower_index', as: 'follower_index'
  get 'users/:id/followed' => 'relationships#followed_index', as: 'followed_index'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end

