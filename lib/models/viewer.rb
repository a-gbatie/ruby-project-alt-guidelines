class Viewer < ActiveRecord::Base
    belongs_to :movie
    belongs_to :review
end