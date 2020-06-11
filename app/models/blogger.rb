class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, presence: true 
    validates :name, uniqueness: true 
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def top_five_most_written_about 
        my_destinations = self.destinations 
        my_top_destinations = my_destinations.sort_by do |destination| 
            destination.posts.count 
        end.reverse 
        my_top_destinations[0..4]
    end 
end
