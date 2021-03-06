Rails.application.routes.draw do

  root 'welcome#index'

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"
  get "sign-out", to: "authentication#delete"
  get "sign-in", to: "authentication#new"
  post "sign-in", to: "authentication#create"

  resources :comments, only: [:destroy]

  resources :cities do
    resources :properties do
      resources :comments
    end
  end



end
