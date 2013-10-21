Trial::Application.routes.draw do

   resources :users do
      resources :petowners
      resources :inventories, :except =>[:show, :edit, :update]
      resources :comments, :only => [:create, :destroy, :index]
   end

   resources :pets
   resources :items

   resources :petowners, :only =>[] do #Prevents building the petowners routes
      resources :equips, :except => [:edit, :update]
      resources :fights, :except => [:edit]
   end

   resources :maintopics do
      resources :subtopics
   end

   resources :subtopics, :only =>[] do #Prevents building the subtopics routes
      resources :narratives, :except => [:show]
   end

   resources :sessions, :only => [:new, :create, :destroy]

   match '/signup', to: 'users#new'
   match '/signin', to: 'sessions#new'
   match '/logout', to: 'sessions#destroy', via: :delete

   root :to => "public_pages#home"
end
