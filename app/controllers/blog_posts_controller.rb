# without this file, you will get a routing error

# inherit from application controller aka action controller
# gives us the info we need to process HTTP requests like parameters
    # and appropriate responses
class BlogPostsController < ApplicationController 
    def index
        # instance variable to ensure we share with index.html.erb to render
        @blog_posts = BlogPost.all
    end

    def show
        @blog_post = BlogPost.find(params[:id])
        # now we have to make a new file in view
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new 
        #create new blog post in memory
        @blog_post = BlogPost.new
    end

    # will finish this in part 7
    def create
    end

end