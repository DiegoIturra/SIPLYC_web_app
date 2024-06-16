class Tablet < ApplicationRecord
    has_many :sessions
    validates :state, inclusion: { 
        in: %w(active inactive), 
        message: "%{value} is an invalid state" 
      }, allow_nil: false
end
