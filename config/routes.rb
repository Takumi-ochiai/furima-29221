Rails.application.routes.draw do
  devise_for :users
  # rootの設定をしましょう
  root to: 'items#index'
  # itemコントローラとindexアクションの設定をしましょう
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
