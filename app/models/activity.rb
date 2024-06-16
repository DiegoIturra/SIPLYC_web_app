class Activity < ApplicationRecord
    has_many :sessions, through: :activity_session
    has_many :exercises, through: :activity_exercise
end
