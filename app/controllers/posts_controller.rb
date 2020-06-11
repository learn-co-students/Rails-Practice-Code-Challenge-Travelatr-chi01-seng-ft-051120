class PostsController < ApplicationController 
    def show 
        @post = Post.find(params[:id]) 
        @blogger = @post.blogger 
        @destination = @post.destination
    end 

    def new 
        @post = Post.new 
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end 

    def create 
        @post = Post.new(post_params) 
        if @post.valid?
            @post.save 
            redirect_to post_path(@post)
        else 
            render :new 
        end 
    end 

    def edit 
        @post = Post.find(params[:id])
        @bloggers = Blogger.all 
        @destinations = Destination.all 
    end 

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            @post.save 
            redirect_to post_path(@post)
        else 
            render :edit 
        end 
    end 

    def like 
        @post = Post.find(params[:id])
        @post.likes += 1 
        @post.save
        redirect_to post_path(@post)
    end 

    private 

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 
end 