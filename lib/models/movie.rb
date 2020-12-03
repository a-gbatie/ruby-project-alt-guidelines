class Movie < ActiveRecord::Base
    belongs_to :viewer
    belongs_to :review
    
end