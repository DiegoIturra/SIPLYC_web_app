class KinderGarden < ApplicationRecord
  belongs_to :city

  def as_json(options = {})
    super(options.merge(include: :city))
  end
end
