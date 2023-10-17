# without this file, you will get a routing error

# inherit from application controller aka action controller
# gives us the info we need to process HTTP requests like parameters
    # and appropriate responses
class BlogPostsController < ApplicationController 
    def index
        # instance variable to ensure we share with index.html.erb to render
        @blog_posts = BlogPost.all
    end        

end