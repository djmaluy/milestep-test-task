class Task < ApplicationRecord
  belongs_to :user

  validates :priority, numericality: true, presence: true
  validates :title, :description, length: { in: 2..100 }, presence: true

  has_one_attached :some_file

  has_and_belongs_to_many :categories

  def some_file_url
    if some_file.attached?
      S3_BUCKET.object(some_file.key).public_url
    end
  end

end
