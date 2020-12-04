class Movie < ActiveRecord::Base
    belongs_to :viewer
    belongs_to :review
    
    def self.top_rated(genre)
    movies = Movie.all.select do |m| 
    m.genre == genre
    end
    binding.pry
        # self.where("rating >= ?", 3)
    end 

end