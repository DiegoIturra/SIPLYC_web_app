class ActivitySession < ApplicationRecord
  belongs_to :activity
  belongs_to :session
end
