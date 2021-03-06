class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :viewer

    def self.get_review(title)
        find_movie = Movie.find_by(title: title)
        find_movie.reviews.each do |r|
            puts "Other viewers rated this movie #{r.rating} out of 5!"
            puts "They particularly liked #{r.fave_scene}"
        end
    end
end
