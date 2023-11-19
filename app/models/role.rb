class Role < ApplicationRecord
    has_many :user, dependent: :nullify
end
