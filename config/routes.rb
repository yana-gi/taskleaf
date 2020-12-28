Rails.application.routes.draw do
  # resourcesメソッドでtaskのアクションを一括で設定することができる
  resources :tasks
end
