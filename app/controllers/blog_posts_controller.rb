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

    # create and save the new blog post
    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            redirect_to @blog_post
        else
            # resuing the new.html.erb instead of making a create.html.erb
            render :new
        end
    end

    # want private to ensure security
    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

end