Trial::Application.routes.draw do

  resources :comments


   resources :users do
      resources :petowners
      resources :inventories
   end

   resources :pets
   resources :items

   resources :petowners, :only =>[] do #Prevents building the petowners routes
      resources :equips
      resources :fights
   end

   resources :maintopics do
      resources :subtopics
   end

   resources :subtopics, :only =>[] do #Prevents building the subtopics routes
      resources :narratives
   end

   resources :sessions, :only => [:new, :create, :destroy]

   match '/signup', to: 'users#new'
   match '/signin', to: 'sessions#new'
   match '/logout', to: 'sessions#destroy', via: :delete

   root :to => "public_pages#home"
end
