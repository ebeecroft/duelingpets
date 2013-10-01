Trial::Application.routes.draw do

  resources :users do
     resources :petowners
  end

  resources :pets

  resources :maintopics do
     resources :subtopics
  end

  resources :narratives


  resources :comments


  resources :fights


  resources :pet_items


  resources :inventories

  resources :items

end
