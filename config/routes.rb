Rails.application.routes.draw do

  resources :registered_applications

  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
end
