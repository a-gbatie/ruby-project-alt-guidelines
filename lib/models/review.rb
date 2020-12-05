class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :viewer


    def self.get_review(title)
        all_reviews = Review.all
        get_movie = all_reviews.map {|r| r.title}
        # get_movie.select {|m| m.title == title}
        binding.pry
    end
end
