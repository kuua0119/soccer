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
    patch 'users/:id', to: 'users#update', as: :update_user_profile
    resources :posts
    resources :communities
    
  end
end
