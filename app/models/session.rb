class Session < ApplicationRecord
    belongs_to :teacher
    belongs_to :student
    belongs_to :tablet
    has_many :activity , through: :activity_session
end
