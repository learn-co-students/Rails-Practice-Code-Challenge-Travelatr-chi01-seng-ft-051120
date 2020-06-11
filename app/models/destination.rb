class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

    validates :name, uniqueness: true

    def five_most_recent
        my_recent_posts = self.posts.sort_by do |post|
            post.id
        end.reverse
        my_recent_posts[0..4]
    end 
end
