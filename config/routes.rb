Rails.application.routes.draw do
  # post 'bookmarks/create' from our pc to server
  # get 'bookmarks/new'
  # get 'lists/index' get controller#action
  # get 'lists/show'
  # get 'lists/create'
  # get 'lists/new'
  # get 'lists/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root 'lists#index'
  # root 'posts#index'

 # index to get all the lists
  resources :lists, only: %i[index show new create  destroy] do
    resources :bookmarks, only: %i[new create]
  end
  # we don t need the id of the list to destroy, edit, update,
  resources :bookmarks, only: %i[destroy]
end

# As a user, I can see all my movie lists
# As a user, I can create a movie list
# As a user, I can see the details of a movie list
# As a user, I can bookmark a movie inside a movie list
# As a user, I can destroy a bookmark

# Warning the movies will be seeded in the database
#  so no need to implement any user action around the movie model.

# bookmarks; relational db that links movies to the list that happens in the `backend
# No need to create movie controller or new movies because we only
#  need to see movies that appears in the list through bookmarks
