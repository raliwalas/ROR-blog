Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #index action will display all of the blog posts
   root "blog_posts#index" 
end
