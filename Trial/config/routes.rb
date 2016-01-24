Trial::Application.routes.draw do


   #Builds the users actions and the nested actions
   get '/users/maintenance' => 'users#maintenance'
   resources :users, :except => [:new] do
#      get '/:id/page/:page', :action => :index, :on => :collection
      resources :petowners
      resources :inventories, :only =>[:index, :create, :destroy]
      resources :comments, :only => [:create, :destroy]
      resources :forums
      resources :sbooks
   end

   #Builds the series
   get '/sbooks/maintenance' => 'sbooks#maintenance'
   get 'sbooks/list' => 'sbooks#list'
   resources :sbooks, :only => [:index] do
      resources :books, :except =>[:index]
   end
#get '/:id/page/:page', :action => :show, :on => :collection

   #Builds the books
   get '/books/maintenance' => 'books#maintenance'
   resources :books, :only => [:index] do
      resources :chapters, :except => [:index, :show]
   end

   #Builds the chapters
   get '/chapters/maintenance' => 'chapters#maintenance'
   get 'chapters/review' => 'chapters#review'
   post 'chapters/review1' => 'chapters#approve'
   post 'chapters/review2' => 'chapters#deny'
   resources :chapters, :only => [:index]
   resources :gchapters

   #Comments actions
   resources :comments, :only =>[:index]

   #Suggestion box for users
   resources :suggestions, :except =>[:edit, :update, :show]

   #Inventory routes
   get '/inventories/maintenance' => 'inventories#maintenance'
   resources :inventories, :only =>[:index]

   #Money Bag
   resources :pouches, :only => [:index]

   #Builds the pet actions
   get '/pets/maintenance' => 'pets#maintenance'
   get '/pets/list' => 'pets#list'
   get '/pets/review' => 'pets#review' #has to be before the pets controller
   get '/pets/monsters' => 'pets#monsters'

   #Accept and deny if both post actions then we need '/pets/reviews/accept or /pets/reviews/deny'
   post 'pets/review1' => 'pets#approve'
   post 'pets/review2' => 'pets#deny'

   #Base pets route
   resources :pets

   #Builds the item actions
   get '/items/maintenance' => 'items#maintenance'
   resources :items

   #Builds the equips and fights actions
   get '/petowners/maintenance' => 'petowners#maintenance'
   resources :petowners, :only =>[:index] do #Prevents building the petowners routes
      resources :equips, :only => [:index, :create, :destroy]
      resources :fights, :except => [:new, :edit, :update]
   end

   #Builds fights path
   get '/fights/maintenance' => 'fights#maintenance'
   post '/petowners/:petowner_id/fights/:id' => 'fights#battle'
   resources :fights, :only =>[:index]

   #Builds equips path
   get '/equips/maintenance' => 'equips#maintenance'
   resources :equips, :only =>[:index]

   #Builds the forum index page and nested routes
   get '/forums/maintenance' => 'forums#maintenance'
   get '/forums/list' => 'forums#list'
   resources :forums, :only =>[:index] do
      resources :tcontainers, :except =>[:index]
   end

   #Builds the container for the topics and the nested routes
   get '/tcontainers/maintenance' => 'tcontainers#maintenance'
   resources :tcontainers, :only =>[:index] do
      resources :maintopics, :except => [:index]
   end

   #Build the forum maintopics actions and the nested actions
   get '/maintopics/maintenance' => 'maintopics#maintenance'
   resources :maintopics, :only =>[:index] do
      resources :subtopics, :except => [:index]
   end

   #Builds the forum narratives actions
   get '/subtopics/maintenance' => 'subtopics#maintenance'
   resources :subtopics, :only =>[:index] do #Prevents building the subtopics routes
      resources :narratives, :except => [:show, :index]
   end

   #Builds the narrative routes
   get '/narratives/maintenance' => 'narratives#maintenance'
   resources :narratives, :only => [:index]

   #Creates the user connection to the website
   resources :sessions, :only => [:create]

   #Login pages + user signup
   get '/signup' => 'users#new'
   get '/signin' => 'sessions#new'
   match '/logout' => 'sessions#destroy', via: :delete #has to be a match condition

   #Builds the sessionkey
   resources :sessionkeys, :only => [:index]

   #Controls page visibility
   resources :maintenancemodes, :except =>[:show, :destroy]

   #Root pages
   get 'maintenance' => "start#maintenance"
   get 'about' => "start#about"
   get 'update' => "start#update"
   get 'contact' => "start#contact"
   post 'create_adoption', to: "petowners#create"
   root :to => "start#home"
end

