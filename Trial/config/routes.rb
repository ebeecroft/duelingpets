Trial::Application.routes.draw do

  resources :pouches


   #Builds the users actions and the nested actions
   resources :users, :except => [:new] do
      resources :petowners
      #PUT    /users/:id(.:format)                                       users#update
#      user_inventory PUT    /users/:user_id/inventories/:id(.:format)              inventories#update
#      put '/inventories/:id(.:format)' => 'inventories#use'
#      put '/inventories/:id/petowners/:id(.:format)' => 'inventories#use'
      resources :inventories, :except =>[:show, :edit, :update]
      resources :comments, :only => [:create, :destroy, :index]
   end

   put '/inventories/:id/petowners/:id(.:format)' => 'inventories#use'
   #Builds the pet and item actions
   get '/pets/reviews' => 'pets#reviews' #has to be before the pets controller
   get '/pets/monsters' => 'pets#monsters'
   post '/pets/reviews' => 'pets#approve'
   match '/pets/:id' => 'pets#deny', via: :post
#   match '/pets/reviews/:id' => 'pets#deny', via: :delete
   resources :pets
#   get '/pets/reviews' => 'pets#reviews'
   resources :items

   #Builds the equips and fights actions
   resources :petowners, :only =>[] do #Prevents building the petowners routes
      resources :equips, :except => [:edit, :update]
#       PUT    /petowners/:petowner_id/fights/:id(.:format)               fights#update
#      post 'petowners/:id/fights/:id' => 'fights#attack'
      put '/fights/:id(.:format)' => 'fights#runner'
      resources :fights, :except => [:edit, :update]
   end

   #Build the forum maintopics actions and the nested actions
   resources :maintopics do
      resources :subtopics
   end

   #Builds the forum narratives actions
   resources :subtopics, :only =>[] do #Prevents building the subtopics routes
      resources :narratives, :except => [:show]
   end

   #Creates the user connection to the website
   resources :sessions, :only => [:create]

   #Login pages + user signup
   get '/signup' => 'users#new'
   get '/signin' => 'sessions#new'
   match '/logout' => 'sessions#destroy', via: :delete #has to be a match condition

   #Root pages
   get 'about' => "start#about"
   get 'update' => "start#update"
   get 'contact' => "start#contact"
   post 'create_adoption', to: "petowners#create"
   root :to => "start#home"
end
