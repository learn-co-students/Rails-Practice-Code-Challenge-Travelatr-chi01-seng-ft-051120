class DestinationsController < ApplicationController 
    def show 
        @destination = Destination.find(params[:id])
        @five_most_recent = @destination.five_most_recent
        @featured_post = @destination.posts.max_by do |post| 
            post.likes
        end 
        total_age = @destination.bloggers.uniq.sum do |blogger|
            blogger.age 
        end
        @average_age = total_age / @destination.bloggers.uniq.count 
    end 
end 