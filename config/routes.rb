Rails.application.routes.draw do
  root 'welcome#home'
  get '/welcome/:id', to: 'welcome#show', as: 'welcome'
  get '/gossips/:id', to: 'dynamic_pages#show', as: 'gossip'
  get '/users/:id', to: 'dynamic_pages#user', as: 'user'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
