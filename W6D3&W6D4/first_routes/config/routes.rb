Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # Showing the id
  #ask TA later about when it'd be useful to have alias for a route

  get 'users/:username', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user' #prefix is rails method, only comes into play when request is received
  post 'users/', to: 'users#create', as: 'create_user' #is this also for a client to enter this in the URL or just internal?
  patch 'users/:id', to: 'users#update', as: 'update_user' #preferred
  put 'users/:id', to: 'users#update', as: 'put_user' 
  delete 'users/:id', to: 'users#destroy', as: 'delete_user'



  resources :artworks, except: [:index ,:new, :edit]
  resources :users do
    resources :artworks, only: :index
  end

  # Reference
  # localhost:3000/users/:user_id/artworks/:favorite_artworks

  # resources :artworks do
  #     resources :user, only: [:show]
  # end
  # resources :artwork_shares, only: [:create, :destroy]
  get 'artwork_shares/', to: 'artwork_shares#index', as: 'shares'
  post 'artwork_shares/', to: 'artwork_shares#create', as: 'share_artwork'
  delete 'artwork_shares/:id', to: 'artwork_shares#destroy', as: 'unshare_artwork'

  resources :users do # localhost:3000/users/1/
    resources :comments, only: :index # localhost:3000/users/1/comments -> this one just retrieves comments of user with id 1
  end
  resources :artworks do # localhost:3000/artworks/1/
    resources :comments, only: :index # localhost:3000/artworks/1/comments -> this one just retrieves comments of user with id 1
  end
  post 'comments/', to: 'comments#create', as: 'create_comment' # localhost:3000/comments/ -> Creates a comments #input is from form data on client side and that is not in HTTP URL, but inside request body
  delete 'comments/:id', to: 'comments#destroy', as: 'delete_comment' # localhost:3000/comments/1 -> deletes specific one

  # resources :users do
  #   resources :artworks do
  #     member do #member route = includes wildcard id (for custom/non RESTful) vs collection (won't include wildcard)
  
  resources :users do
    resources :artworks do
      member do
        post 'like_and_dislike'
      end
    end
  end
  
end


# By adding a column to the artworks with foreign_key of a favoriter isnt that
# belongs to implying that an artwork can only be favorited by onlu one person?

# Why can't we have a joins table, similar to the artwork_shares, but instead of 
# where we can have on column that is artwork_id and a second thats called
# favoriter_id. 

# Why not add the column to a user or like a like but this time we add a route to it.
#favorite share of one
# where favorite == true