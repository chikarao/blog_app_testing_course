Rails.application.routes.draw do

  devise_for :users
  root to: "articles#index"

  resources :articles do
    resources :comments
    # creates nested routes /articles/:id/comments/:id
  end
end
