Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
    get "users/mypage", to: "users#mypage", as: :users_mypage
    get 'users/:id/edit', to: 'users#edit', as: :edit_user_profile
    get "search", to: "searches#search", as: :search
    patch 'users/:id', to: 'users#update', as: :update_user_profile
    delete "users/:id", to: "users#destroy", as: :destroy_user_profile

    resources :users, only: [:show] do
      resources :relationships, only: [:create, :destroy]
      member do
        get :following, to: "relationships#following"
        get :followers, to: "relationships#followers" 
      end
    end

    resources :likes, only: [:index]

    resources :rooms, only: [:show, :create]

    resources :direct_messages, only: [:create]

    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create] do
        delete :destroy, on: :collection
      end
    end

    resources :communities do
      resources :community_users, only: [:create, :destroy]
      resources :community_messages, only: [:index, :create]
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :communities do
      resources :community_users, only: [:destroy]
    end
    resources :clubs, only: [:index, :edit, :update, :destroy]
  end
end
