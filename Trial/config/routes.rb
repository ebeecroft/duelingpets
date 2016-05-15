Trial::Application.routes.draw do

   #Builds the users actions and the nested actions
   get '/users/maintenance' => 'users#maintenance'
   resources :users, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #builds everything except new
#      get '/:id/page/:page', :action => :index, :on => :collection
      resources :petowners, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything
      resources :inventories, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #:only =>[:index, :create, :destroy] #Builds only index, create, destroy
      resources :comments, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #:only => [:create, :destroy] #Builds only create and destroy
      resources :forums, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything 
      resources :sbooks, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything
      resources :mainfolders, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything
   end

   #Builds the mainfolders
   get '/mainfolders/maintenance' => 'mainfolders#maintenance'
   get 'mainfolders/list' => 'mainfolders#list'
   resources :mainfolders, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :subfolders, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Everything except index
   end

   #Builds the subfolders
   get '/subfolders/maintenance' => 'subfolders#maintenance'
   resources :subfolders, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :artworks, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Everything except index
   end

   #Builds the artworks
   get '/artworks/maintenance' => 'artworks#maintenance'
   get '/artworks/review' => 'artworks#review' #has to be before the pets controller
   post 'artworks/review1' => 'artworks#approve'
   post 'artworks/review2' => 'artworks#deny'
   resources :artworks, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Builds the series
   get '/sbooks/maintenance' => 'sbooks#maintenance'
   get 'sbooks/list' => 'sbooks#list'
   resources :sbooks, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :books, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Everything except index
   end
#get '/:id/page/:page', :action => :show, :on => :collection

   #Builds the books
   get '/books/maintenance' => 'books#maintenance'
   resources :books, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :chapters, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #everything except index and show
   end

   #Builds the chapters
   get '/chapters/maintenance' => 'chapters#maintenance'
   get 'chapters/review' => 'chapters#review'
   post 'chapters/review1' => 'chapters#approve'
   post 'chapters/review2' => 'chapters#deny'
   resources :chapters, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index
   resources :gchapters, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Comments actions
   resources :comments, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Suggestion box for users
   resources :suggestions, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Everything except edit, update, and show

   #Inventory routes
   get '/inventories/maintenance' => 'inventories#maintenance'
   resources :inventories, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Money Bag
   resources :pouches, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Builds the pet actions
   get '/pets/maintenance' => 'pets#maintenance'
   get '/pets/list' => 'pets#list'
   get '/pets/review' => 'pets#review' #has to be before the pets controller
   get '/pets/monsters' => 'pets#monsters'

   #Accept and deny if both post actions then we need '/pets/reviews/accept or /pets/reviews/deny'
   post 'pets/review1' => 'pets#approve'
   post 'pets/review2' => 'pets#deny'

   #Base pets route
   resources :pets, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything for pets

   #Builds the item actions
   get '/items/maintenance' => 'items#maintenance'
   resources :items, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything for items

   #Builds the equips and fights actions
   post 'petowners/increase1' => 'petowners#health'
   post 'petowners/increase2' => 'petowners#attack'
   post 'petowners/increase3' => 'petowners#defense'
   post 'petowners/increase4' => 'petowners#speed'
   get '/petowners/maintenance' => 'petowners#maintenance'
   resources :petowners, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Prevents building the petowners routes #Only index
      resources :equips, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only builds index, create and destroy
      resources :fights, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything except new, edit, and update
   end

   #Builds fights path
   get '/fights/maintenance' => 'fights#maintenance'
   post '/petowners/:petowner_id/fights/:id' => 'fights#battle'
   resources :fights, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Builds equips path
   get '/equips/maintenance' => 'equips#maintenance'
   resources :equips, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Builds the forum index page and nested routes
   get '/forums/maintenance' => 'forums#maintenance'
   get '/forums/list' => 'forums#list'
   resources :forums, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :tcontainers, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything but index
   end

   #Builds the container for the topics and the nested routes
   get '/tcontainers/maintenance' => 'tcontainers#maintenance'
   resources :tcontainers, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :maintopics, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything except index
   end

   #Build the forum maintopics actions and the nested actions
   get '/maintopics/maintenance' => 'maintopics#maintenance'
   resources :maintopics, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Only index
      resources :subtopics, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything except index
   end

   #Builds the forum narratives actions
   get '/subtopics/maintenance' => 'subtopics#maintenance'
   resources :subtopics, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] do #Prevents building the subtopics routes #Only index
      resources :narratives, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything except index and show
   end

   #Builds the narrative routes
   get '/narratives/maintenance' => 'narratives#maintenance'
   resources :narratives, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Creates the user connection to the website
   resources :sessions, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only create

   #Creates the recovery routes
   resources :passwordrecoveries, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only create

   #Login pages + user signup
   get '/recover' => 'passwordrecoveries#new'
   get '/signup' => 'users#new'
   get '/signin' => 'sessions#new'
   match '/logout' => 'sessions#destroy', via: :delete #has to be a match condition

   #Builds the sessionkey
   resources :sessionkeys, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only index

   #Builds the staff
   resources :usertypes, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Only builds index, new, create, edit and update actions

   #Controls page visibility
   resources :maintenancemodes, :except =>[:index, :show, :new, :create, :edit, :update, :destroy] #Builds everything except show and destroy

   #Root pages
   get 'maintenance' => "start#maintenance"
   get 'about' => "start#about"
   get 'update' => "start#update"
   get 'contact' => "start#contact"
   post 'create_adoption', to: "petowners#create"
   root :to => "start#home"
end
