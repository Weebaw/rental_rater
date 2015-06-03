Rails.application.routes.draw do

  root 'welcome#index'

  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"
  get "sign-out", to: "authentication#delete"
  get "sign-in", to: "authentication#new"
  post "sign-in", to: "authentication#create"


  resources :cities do
    resources :properties
  end


end
