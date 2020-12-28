Rails.application.routes.draw do
  # ホーム設定
  root to: 'tasks#index'
  # resourcesメソッドでtaskのアクションを一括で設定することができる
  resources :tasks
end
