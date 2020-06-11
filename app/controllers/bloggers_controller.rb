class BloggersController < ApplicationController 
    def show 
        @blogger = Blogger.find(params[:id])
        @likes_count = @blogger.posts.map do |post|
            post.likes 
        end.sum
        @featured_post = @blogger.posts.max_by do |post| 
            post.likes
        end 
        @most_popular_destinations = @blogger.top_five_most_written_about
    end 

    def new 
        @blogger = Blogger.new 
    end 

    def create 
        @blogger = Blogger.new(blogger_params) 
        if @blogger.valid?
            @blogger.save 
            redirect_to blogger_path(@blogger)
        else 
            render :new 
        end 
    end 

    private 

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 
end 