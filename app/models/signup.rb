class Signup < ApplicationRecord
  belongs_to :camper
  belongs_to :activities

  # validates :time, numericality: {:in 0..23}
  validates :time, inclusion: 0..23
  
end
