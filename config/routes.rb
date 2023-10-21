Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # line from command line 'rails g device User '
  devise_for :users

=begin
  - this line makes all of the routes for us
  - BUT still need to define our root (unless we want default)
  - instead of having all the individual get, patch, etc lines (see early commits before part 8 or 9)
=end
  resources :blog_posts




  # Defines the root path route ("/")
  # index action will display all of the blog posts
  root "blog_posts#index" 
end
