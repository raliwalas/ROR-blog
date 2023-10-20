# inherit from application controller aka action controller
# the controller gives us the info we need to process HTTP requests like parameters
    # and appropriate responses
class BlogPostsController < ApplicationController 

=begin refactoring 1/2
    - set_blog_post allows us reduce the num of lines in code
    - before: the methods show, edit, update, etc all had the same line to set blog action
    - now: line 11 only and the set_blog_action method
    - could also define before action with except: instead of only
=end 
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
        # instance variable to ensure we share with index.html.erb to render
        @blog_posts = BlogPost.all
    end

    def show
        # rescue that used to be here was moved to set_blog_post
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
        # calls on before_action
    end

    def update
        # find the id again, instead of creating brand new post
        if @blog_post.update(blog_post_params) # use same title and body params
            redirect_to @blog_post
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    # don't need if/else bc we assume that destroy is successful
    # then redirect to root path cause blog post doesn't exist anymore
    def destroy
        @blog_post.destroy
        redirect_to root_path
    end

    # want private to ensure security
    private

    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end


    # refactoring 2/2
    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound # used to be in show, 
        #but it's optional depending on application
        redirect_to root_path
    end

end