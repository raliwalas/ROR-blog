Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # new needs to be first so it's not processed as a blog post id
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post

  # to make individual pages for each blog post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  # to make a create action and send you to elsewhere when you are done
  # also makes authenticity_token to protect the form
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts

  # Defines the root path route ("/")
  # index action will display all of the blog posts
  root "blog_posts#index" 
end
