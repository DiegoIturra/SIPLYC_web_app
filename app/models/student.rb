class Student < ApplicationRecord
  belongs_to :kinder_garden
  belongs_to :age_range
  has_many :teacher_students
  has_many :teachers, through: :teacher_students
  has_one :student_file
  
  validates :gender, inclusion: { 
    in: %w(femenino masculino), 
    message: "%{value} no es un género válido" 
  }
end
