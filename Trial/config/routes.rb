Trial::Application.routes.draw do
  resources :users


  resources :narratives


  resources :subtopics


  resources :maintopics


  resources :comments


  resources :fights


  resources :pet_items


  resources :inventories


  resources :pet_owners


  resources :items


  resources :pets

end
