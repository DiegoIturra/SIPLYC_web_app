class Exercise < ApplicationRecord
    has_many :activity, through: :activity_exercise
end
