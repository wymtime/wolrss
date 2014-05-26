WellFed::Application.routes.draw do
  root to: "static_pages#root"
  
  get "api/feeds/titles", to: "api/feeds#titles"
  get "api/feeds/:feed_id/entries/titles", to: "api/entries#titles"
  
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  
  namespace :api, defaults: {format: :json} do 
    resources :categories, only: [:index]
    
    resources :categories, only: [:show]
    
    # resources :categories, only: [:show, :create] do
    #   resources :feeds, only: [:index, :create, :show]
    # end
    
    resources :feeds, only: [:index, :show, :create] do
      resources :entries, only: [:index, :show]
    end
  end
end
