class Movie < ActiveRecord::Base
    has_many :reviews
    has_many :viewers, through: :reviews
    

    def self.top_rated(genre)
        top_reviews = Review.all.select {|r| r.rating >= 3}
        top_movies = top_reviews.map {|r| r.movie}
        top_movies.select {|m| m.genre == genre}
    end 
end

