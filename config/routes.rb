Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #to make individual pages for each blog post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  # Defines the root path route ("/")
  # index action will display all of the blog posts
  root "blog_posts#index" 
end
