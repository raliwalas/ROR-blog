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
            # rendering the new.html.erb instead of making a create.html.erb
            # unprocessable_entity gives 422 error instead of 200 ok
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        # if you don't have this line, you get nil error
        @blog_post = BlogPost.find(params[:id])
    end

    def update
        # find again, instead of creating brand new post
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params) # use same title and body params
            redirect_to @blog_post
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    # don't need if/else bc we assume that destroy is successful
    # then redirect to root path cause blog post doesn't exist anymore
    def destroy
        @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        redirect_to root_path
    end

    # want private to ensure security
    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

end