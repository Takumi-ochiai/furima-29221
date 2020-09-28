Rails.application.routes.draw do
  devise_for :users
  # rootの設定をしましょう
  root to: 'items#index'
  # ルーティングのネスト(モデルと結びついている別モデルのid情報を持ってくる)
  resources :items, only: [:edit, :update, :new, :show, :create, :destroy] do
    resources :orders, only:[:index,:create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
