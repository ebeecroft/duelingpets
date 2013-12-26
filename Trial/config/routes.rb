Trial::Application.routes.draw do

  resources :tcontainers


   #Builds the users actions and the nested actions
   resources :users, :except => [:new] do
      resources :petowners
      resources :pouches, :only => [:index, :create, :new]
      resources :inventories, :except =>[:show, :edit, :update]
      resources :comments, :only => [:create, :destroy, :index]
   end

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
      put '/fights/:id(.:format)' => 'fights#runner'
      resources :fights, :except => [:edit, :update]
   end

   #Builds the container for the topics and the nested routes
   resources :tcontainers do
      resources :maintopics
   end

   #Build the forum maintopics actions and the nested actions
   resources :maintopics, :only =>[] do
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
