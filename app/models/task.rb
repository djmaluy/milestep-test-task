class Task < ApplicationRecord
  belongs_to :user
 
  validates :priority, numericality: true, presence: true
  validates :title, :description, length: { in: 2..100 }, presence: true
end
