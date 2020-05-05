Rails.application.routes.draw do
  resources :gossips
  resources :users, only: [:show]
  
  root 'welcome#home'
  get '/welcome/:id', to: 'welcome#show', as: 'welcome'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
