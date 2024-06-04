class Session < ApplicationRecord
    belongs_to :teacher
    belongs_to :student
    belongs_to :tablet
    has_many :activity , through: :activity_session

    validates :state, presence: true

    validates :state, 
        presence: true,
        inclusion: { 
            in: %w(complete incomplete), 
            message: "%{value} is not a valid state" 
        }, 
        allow_nil: false
end
