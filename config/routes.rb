Rails.application.routes.draw do
    root 'pages#home'
    
    #get '/home'=> 'pages#home'
    #get '/recipes', to:'recipes#index'
    #get '/recipes/new', to: 'recipes#new', as:'new_recipe'
    #post '/recipes', to:'recipes#create'
    #get '/recipes/:id/edit', to: 'recipe#edit', as:'edit_recipe'
    #patch '/recipes/:id', to:'recipe#update'
    #get '/recipes/:id', to:'recipes#show', as:'recipe'
    #delete 'recipes/:id', to:'recipes#destroy'
    
    resources :recipes do
        member do
            post 'like'
        end
    end
    
end
