Rails.application.routes.draw do
  root 'static_pages#home'

  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end
