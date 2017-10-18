Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  root to: "toppages#index"
  
  get "signup", to: "users#new"
  resources :users do
    member do
        get :user_index
        get :profile
        get :followings
        get :followers
        get :favorites
        
    end
  end
  
  resources :categories, only: [:index] do
    member do
      get :grades
    end
  end

  resources :tags, only: [:index] do
    member do
      get :posts # 特定のタグに紐付く、ポスト一覧を表示する画面
    end
  end

  resources :rankings, only: [:index] 
  get "dayly_ranking", to: "rankings#dayly"
  get "monthly_ranking", to: "rankings#monthly"
  get "whole_ranking", to: "rankings#whole"
    
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete 'logout', to: 'sessions#destroy'
  
  resources :relationships, only: [:create, :destroy]
  
  resources :posts do
    collection do
      get :tags
    end
  end

  resources :posts_tags, only: [:create, :destroy]
  
  resources :comments, only: [:show, :edit, :create, :update, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
  resources :articles
end
