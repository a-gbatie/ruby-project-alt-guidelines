class Review < ActiveRecord::Base
    has_many :viewers
    has_many :viewers, through: :movies
end
